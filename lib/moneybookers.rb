require "moneybookers/version"
require "moneybookers/request"
require "moneybookers/payment_gateway/client"
require "moneybookers/payment_gateway/response"
require "moneybookers/api/email_check"
require "moneybookers/api/pay_on_demand"
require "moneybookers/signature/base"
require "moneybookers/signature/secure_url"
require "moneybookers/signature/status"

module Moneybookers
  HOST = "https://www.moneybookers.com/"
  SERVICE_IPS = %w{213.129.75.201 213.129.75.203 91.208.28.7 91.208.28.8 91.208.28.9 91.208.28.4 91.208.28.5 91.208.28.6
    193.105.47.4 193.105.47.5 193.105.47.6 193.105.47.7 193.105.47.8 193.105.47.9}

  class << self
    attr_accessor :merchant_id, :email, :secret_word_md5, :password

    def configure
      yield self
    end
  end
end
