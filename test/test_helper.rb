require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# A fim de organizar as dependencias do test, foi criado o diretorio support
Dir['./test/support/**/*.rb'].each do |file|
  require file
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  TestNotifier.default_notifier = :notify_send
end
