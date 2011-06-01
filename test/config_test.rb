require "helper"

describe "Configuration" do
  it "should allow to set custom settings" do
    Moneybookers.configure do |config|
      config.merchant_id     = "fake"
      config.email           = "john@doe.com"
      config.secret_word_md5 = "md5"
      config.password        = "secretmd5"
    end

    assert_equal "fake", Moneybookers.merchant_id
    assert_equal "john@doe.com", Moneybookers.email
    assert_equal "md5", Moneybookers.secret_word_md5
    assert_equal "secretmd5", Moneybookers.password
  end
end
