require "helper"

describe "PaymentGateway::Client" do
  it "should validate required attributes" do
    client = Moneybookers::PaymentGateway::Client.new({})
    assert_raises(ArgumentError) do
      client.validate_parameters
    end
  end
end
