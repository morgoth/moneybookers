require "cgi"

module Moneybookers::PaymentGateway
  class Client
    attr_reader :response, :parameters

    def initialize(params={})
      @parameters = params
    end

    # TODO: validate required params
    def prepare
      @response = Moneybookers::Request.new.post("/app/payment.pl", {:prepare_only => 1}.merge(parameters))
    end

    def session_id
      CGI::Cookie.parse(response["Set-Cookie"])["SESSION_ID"].first
    end
  end
end
