RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :controller
  config.include Warden::Test::Helpers, type: :feature

  config.before do
    Warden.test_mode! if self.class.metadata[:devise]
  end

  config.after do
    Warden.test_reset! if self.class.metadata[:devise]
  end
end