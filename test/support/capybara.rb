require 'capybara/rails'

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  self.use_transactional_fixtures = false

  Capybara::Webkit.configure do |config|
    permit = %w[
      fonts.googleapis.com
      www.gravatar.com
    ]
    config.allow_url(permit)
  end

  def setup
    Capybara.javascript_driver = :webkit
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
