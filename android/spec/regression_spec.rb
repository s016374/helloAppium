# android/spec/regression_spec.rb
require 'appium_lib'

RSpec.describe "Regression testing for DM android client" do
  context "splash screen" do
    it "swipe splash screen, then click GO." do
      4.times do
        swipe start_x: window_size.width*0.8, start_y: window_size.height*0.5, delta_x: -(window_size.width*0.5)
        sleep 1
      end
      id('now_into').click
      sleep 2
    end
  end

  context "login signup forgetpassword" do
    it "signup page" do
      id('tv_reg').click
      expect(id('textView1').text).to eq "用户注册"
      back
    end

    it "forgetpassword page" do
      id('tv_forgetpassword').click
      expect(id('textView1').text).to eq "找回密码"
      back
    end

    it "login" do
      id('rl_user_name').click
      id('rl_user_name').send_keys "test_364478262"
      id('rl_password').click
      id('rl_password').send_keys "123456"
      button(1).click
      expect(exists { id('tv_bra_title') }).to be true
    end

    # seems an issue
    xit "auth session" do
      close_app
      launch_app
      expect(exists { id('tv_bra_title') }).to be true
    end
  end
end
