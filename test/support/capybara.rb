require 'capybara/rails'

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  self.use_transactional_fixtures = false

  Capybara::Webkit.configure do |config|
    config.allow_url("fonts.googleapis.com")
  end

  def setup
    Capybara.javascript_driver = :webkit
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
