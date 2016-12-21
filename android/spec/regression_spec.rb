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
      id('rl_user_name').send_keys "lishenyang"
      id('rl_password').click
      id('rl_password').send_keys "125800"
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

  context "settings" do
    it "enter and back one by one" do
      id('rlTabFive').click
      expect(id('tvWebDataOrInfo').text).to eq "设置"
      id('textView2').click
      back
    end
  end

  context "news" do
    it "enter news and check list" do
      id('rlTabFour').click
      expect(id('tvWebDataOrInfo').text).to eq "资讯"
      find_elements(:class, 'android.view.View').length > 20
    end
  end

  context "data" do
    it "enter data and check page" do
      id('rlTabTwo').click
      buttons.each { |btn| btn.click }
      find_elements(:class, 'android.view.View').length > 10
    end
  end

  context "home" do
    it "enter home and check page" do
      id('rlTabOne').click
      find_elements(:class, 'android.widget.TextView').each_with_index do |element, i|
        if i % 2 == 0
          element.click
          back
        end
      end
    end

    it "message" do
      id('rlMessage').click
      expect(text('搜索')).to_not be_nil
      2.times { back }
    end

    it "search" do
      id('tv_bra_title').click
      expect(id('textView1').text).to eq "热门搜索："
      back
    end
  end


end
