module ControllerMacros
  def login_user
    before(:each) do
      sign_out :user
      sign_in Factory.create(:user)
    end
  end

  def use_iphone
    before(:each) do
      agent = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7"
      request.env['HTTP_USER_AGENT'] = agent
    end
  end
end
