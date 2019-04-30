require 'simplecov'
require 'timecop'
require 'json_expressions/rspec'
SimpleCov.start 'rails' do
  formatter SimpleCov::Formatter::HTMLFormatter
end

require 'factory_bot_rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.fail_fast = true
  config.include FactoryBot::Syntax::Methods

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.around do |example|
    Rails.cache.clear
    example.run
  end
end
