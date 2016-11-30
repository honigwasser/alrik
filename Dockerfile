FROM honigwasser/base-rails-ruby-2.3

# Preinstall some gems to speed up the container build and facilitate caching
WORKDIR /tmp/
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bash -l -c "bundle install"

# Add the source
ADD ./ /var/www/
WORKDIR /var/www/
RUN find . -name "*.sw?" -exec rm \{\} \+
RUN mkdir -p log tmp/pids tmp/sockets tmp/cache

# Prepare for the future!
RUN chown -R root:root .
RUN chown -R www-data:www-data log/ tmp/
RUN find log/ -type f -delete

ADD ./docker/nginx/ /etc/nginx/

EXPOSE 3000 8080
