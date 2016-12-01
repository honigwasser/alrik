source "https://rubygems.org"
git_source(:gitblit) { |repo_name| "git://git.pressrelations.de/#{repo_name}.git" }
git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

gem "rails"
gem "rails-api"
gem "rails_param", github: "nicolasblanco/rails_param", ref: "c806552361b7c820b050bbf52f5a772a2b40048b"
gem "rack-cors", require: "rack/cors"
gem "active_model_serializers"
gem "kaminari"

gem "jbuilder", "~> 2.0"
gem "json-schema"
gem "composite_primary_keys"

group :development, :test do
  gem "sqlite3"
  gem "json_expressions"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem "guard-rubocop"
  gem "spring-commands-rspec"
  gem "pry-rails"
end

group :development do
  gem "spring"
end

group :test do
  gem "faker"
  gem "rubocop"
  gem "minitest-reporters"
  gem "simplecov", require: false
  gem "timecop"
end

group :development, :staging, :production do
  gem "protokoll", gitblit: "gems/protokoll"
  gem "protokoll-rails", gitblit: "gems/protokoll-rails"
  gem "unicorn"
  gem "unicorn-rails"
  gem "baby_bouncer", gitblit: "gems/baby_bouncer"
end

group :staging, :production do
  gem "tiny_tds"
  gem "activerecord-sqlserver-adapter"
  gem "slack", gitblit: "gems/slack"
end

gem "geist", gitblit: "gems/geist"
gem "jenny", gitblit: "gems/jenny"
gem "sesam", gitblit: "gems/sesam"
