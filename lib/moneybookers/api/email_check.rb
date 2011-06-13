module Moneybookers::API
  class EmailCheck
    attr_reader :parameters, :request_response

    def initialize(params={})
      params[:password] ||= Moneybookers.password
      params[:cust_id] ||= Moneybookers.merchant_id
      @parameters = params
    end

    def request
      @request_response = Moneybookers::Request.new.get("/app/email_check.pl", parameters)
      handle_request_response
    end

    def handle_request_response
      # TODO: implement
      true
    end
  end
end
