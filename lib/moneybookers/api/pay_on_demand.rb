require "rexml/document"

module Moneybookers::API
  class PayOnDemand
    attr_reader :parameters, :prepare_response, :request_response, :session_id, :mb_transaction_id, :amount, :currency, :status, :status_code

    def initialize(params={})
      params[:password] ||= Moneybookers.password
      params[:email] ||= Moneybookers.email
      @parameters = params
    end

    def prepare
      validate_prepare_parameters
      @prepare_response = Moneybookers::Request.new.post("/app/ondemand_request.pl", parameters.merge({:action => "prepare"}))
      handle_prepare_response
    end

    def request(params={})
      params[:action] ||= "request"
      params[:sid] ||= session_id || raise(ArgumentError.new("You must specify sid for pay-on-demand request transaction"))
      @request_response = Moneybookers::Request.new.post("/app/ondemand_request.pl", params)
      handle_request_response
    end

    # TODO: handle errors - moneybookers returns 200 with xml error_msg
    def handle_prepare_response
      document = REXML::Document.new(@prepare_response.body)
      raise StandardError.new(document.elements["response/error/error_msg"].text) if document.elements["response/error"]
      @session_id = document.elements["response/sid"].text
      true
    end

    def handle_request_response
      document = REXML::Document.new(@request_response.body)
      raise StandardError.new(document.elements["response/error/error_msg"].text) if document.elements["response/error"]
      document = document.elements["response/transaction"]
      @mb_transaction_id = document.elements["id"].text
      @amount         = document.elements["amount"].text
      @currency       = document.elements["currency"].text
      @status         = document.elements["status_msg"].text
      @status_code    = document.elements["status"].text
      true
    end

    def validate_prepare_parameters
      [:email, :password, :amount, :currency].each do |attribute|
        raise ArgumentError.new("You must specify #{attribute} for preparing pay-on-demand transaction") unless parameters[attribute]
      end
      if !parameters.has_key?(:rec_payment_id) and !parameters.has_key?(:frn_transaction_id)
        raise ArgumentError.new("You must specify frn_transaction_id or rec_payment_id for preparing pay-on-demand transaction")
      end
      true
    end
  end
end
