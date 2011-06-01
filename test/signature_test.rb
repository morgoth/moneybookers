require "helper"

describe "Signature::SecureUrl" do
  it "should be calculated" do
    signature = Moneybookers::Signature::SecureUrl.new({:merchant_id => "20422434", :transaction_id => "s667", :secret_word_md5 => "FB834F96921EA0ACAAB7792BD9A46DD7"})
    assert_equal "1E9B7834103B2DCAD524544622D41E91", signature.to_s
  end
end
