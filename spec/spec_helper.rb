ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('railsapp/config/environment', __dir__)
require 'rspec/rails'

RSpec::OpenAPI.path = File.expand_path('railsapp/doc/openapi.yaml', __dir__)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  if ENV['OPENAPI']
    config.before(:suite) do
      FileUtils.rm_f(RSpec::OpenAPI.path)
    end
  end
end
