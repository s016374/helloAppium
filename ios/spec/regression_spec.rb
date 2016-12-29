# ios/spec/regression_spec.rb
require 'appium_lib'

RSpec.describe "Regression testing for DM ios client" do
  context "splash screen" do
    it "swipe splash screen, then click GO." do
      3.times do
        swipe start_x: window_size.width*0.8, start_y: window_size.height*0.5, delta_x: -(window_size.width*2)
      end
      button(1).click
    end
  end

  context "login signup forgetpassword" do
    it "signup page" do
      button("用户注册").click
      expect(find_element(:name, "注册").text).to eq "注册"
      button('arrow back').click
      sleep 1
    end

    it "forgetpassword page" do
      button("忘记密码?").click
      expect(find_element(:name, "找回密码").text).to eq "找回密码"
      button('arrow back').click
      sleep 1
    end

    it "login" do
      textfield(1).send_keys "lishenyang"
      textfield(2).send_keys "125800"
      button('登    录').click
      sleep 1
      # TODO appium exists an issue that can't get elements on main page which having load more function.
    end

    xit "auth session" do
      close_app
      launch_app
    end
  end

  context "settings" do
    it "enter and back one by one" do
      # button("设置未选中").click #appium exists an issue that can't get elements on main page which having load more function.
      Appium::TouchAction.new.press(x: 330, y: 640).release.perform
      expect(find_element(:name, "设置").text).to eq "设置"
      find_element(:name, "个人资料").click
      button('arrow back').click
      find_element(:name, "修改密码").click
      button('arrow back').click
      find_element(:name, "报价管理").click
      button('arrow back').click
      find_element(:name, "DM指南").click
      button('arrow back').click
    end
  end

  context "news" do
    it "enter news and check list" do
      button("资讯未选中").click
      expect(find_element(:name, "资讯").text).to eq "资讯"
      expect(find_elements(:class, "XCUIElementTypeLink").length).to be > 20
    end
  end

  context "data" do
    it "enter data and check page" do
      button("数据未选中").click
      expect(find_element(:name, "数据").text).to eq "数据"
      find_element(:name, "线上资金").click
      2.times {find_element(:name, "线下资金").click}
      2.times {find_element(:name, "票据").click}
      2.times {find_element(:name, "理财").click}
      find_element(:name, "债券").click

      find_element(:name, "存单指导价").click
      find_element(:name, "行情分析").click
    end
  end


  context "publish price" do
    it "check all buttons work" do
      button("发报价未选中").click
      expect(exists { button("线上") }).to be true
      expect(exists { button("线下") }).to be true
      expect(exists { button("理财") }).to be true
      expect(exists { button("票据") }).to be true
      expect(exists { button("非标资产") }).to be true
      expect(exists { button("现券买卖") }).to be true
      button("关闭").click
    end
  end

end
