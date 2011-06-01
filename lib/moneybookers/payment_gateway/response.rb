module Moneybookers::PaymentGateway
  class Response
    attr_reader :params

    def initialize(params)
      raise ArgumentError.new("Params must be passed as a hash") unless params.kind_of?(Hash)
      @params = params
    end

    def status_code
      params["status"]
    end

    def status
      case status_code
        when "2"  then "processed"
        when "0"  then "pending"
        when "-1" then "cancelled"
        when "-2" then "failed"
        when "-3" then "chargeback"
      end
    end

    def processed?
      status == "processed"
    end

    def pay_on_demand_authorized?
      processed? and (params["rec_payment_type"] == "on-demand")
    end

    def pay_on_demand_id
      params["rec_payment_id"] if pay_on_demand_authorized?
    end

    def amount
      params["mb_amount"]
    end

    def currency
      params["mb_currency"]
    end

    def mb_transaction_id
      params["mb_transaction_id"]
    end

    def signature_verified?(args={})
      Moneybookers::Signature::Status.new(signature_params.merge(args)).match?(params["md5sig"])
    end

    private

    def signature_params
      {:transaction_id => params["transaction_id"], :mb_amount => amount, :mb_currency => currency, :status => status_code}
    end
  end
end
