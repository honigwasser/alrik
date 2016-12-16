source "https://rubygems.org"
git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }
git_source(:honigwasser) { |repo_name| "https://github.com/honigwasser/#{repo_name}.git" }

gem "active_model_serializers"
gem "kaminari"
gem "rack-cors", require: "rack/cors"
gem "rails"
gem "rails-api"
gem "rails_param", github: "nicolasblanco/rails_param", ref: "c806552361b7c820b050bbf52f5a772a2b40048b"

gem "composite_primary_keys"
gem "jbuilder", "~> 2.0"
gem "json-schema"

group :development, :test do
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem "guard-rubocop"
  gem "json_expressions"
  gem "pry-rails"
  gem "rspec-rails"
  gem "spring-commands-rspec"
  gem "sqlite3"
end

group :development do
  gem "spring"
end

group :test do
  gem "faker"
  gem "minitest-reporters"
  gem "rubocop"
  gem "simplecov", require: false
  gem "timecop"
end

group :development, :staging, :production do
  gem "unicorn"
  gem "unicorn-rails"
end

group :staging, :production do
  gem "activerecord-sqlserver-adapter"
  gem "slack", honigwasser: "gem-slack"
  gem "tiny_tds"
end

gem "sesam", honigwasser: "gem-sesam"
