# Use at least one worker per core if you're on a dedicated server,
# more will usually help for _short_ waits on databases/caches.
workers = (ENV["WORKERS"] || `cat /proc/cpuinfo | grep processor | wc -l`).to_i
workers = 1 if workers < 1
worker_processes(workers)

# Since Unicorn is never exposed to outside clients, it does not need to
# run on the standard HTTP port (80), there is no reason to start Unicorn
# as root unless it's from system init scripts.
# If running the master process as root and the workers as an unprivileged
# user, do this to switch euid/egid in the workers (also chowns logs):
# user "www-data", "www-data"

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory "/var/www" # available in 0.94.0+

# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen 3000, tcp_nopush: true
listen "/var/www/tmp/sockets/unicorn.sock", backlog: 64

# nuke workers after 60 seconds (the default)
timeout 60

# feel free to point this anywhere accessible on the filesystem
pid "/var/www/tmp/pids/unicorn.pid"

# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:

# combine Ruby 2.0.0dev or REE with "preload_app true" for memory savings
# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
preload_app true
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

# Enable this flag to have unicorn test client connections by writing the
# beginning of the HTTP headers before calling the application.  This
# prevents calling the application for connections that have disconnected
# while queued.  This is only guaranteed to detect clients on the same
# host unicorn runs on, and unlikely to detect disconnects even on a
# fast LAN.
check_client_connection false

before_fork do |_server, _worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |_server, _worker|
  # the following is *required* for Rails + "preload_app true",
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end

# Unicorn events should be logged as JSON in Logstash format
require 'logstash-event'

logger = Logger.new(STDOUT)
logger.formatter = proc do |severity, _datetime, _progname, msg|
  log = LogStash::Event.new(severity: severity, message: msg).to_json
  "#{log}\n"
end
logger(logger)
