require "cgi"

module Moneybookers::PaymentGateway
  class Client
    attr_reader :response, :parameters

    def initialize(params={})
      @parameters = params
    end

    def prepare
      validate_parameters
      @response = Moneybookers::Request.new.post("/app/payment.pl", {:prepare_only => 1}.merge(parameters))
    end

    def session_id
      CGI::Cookie.parse(response["Set-Cookie"])["SESSION_ID"].first
    end

    def validate_parameters
      [:pay_to_email, :language, :amount, :currency, :detail1_description, :detail1_text].each do |attribute|
        raise ArgumentError.new("You must specify #{attribute} in parameters") unless parameters.keys.include?(attribute)
      end
    end
  end
end
