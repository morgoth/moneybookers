module Moneybookers::Signature
  class Status < Base
    attr_accessor :mb_amount, :mb_currency, :status

    def initialize(params={})
      super
      @mb_amount = params[:mb_amount] || raise(ArgumentError, "No mb_amount given")
      @mb_currency = params[:mb_currency] || raise(ArgumentError, "No mb_currency given")
      @status = params[:status] || raise(ArgumentError, "No status given")
    end

    def params
      [merchant_id.to_s, transaction_id.to_s, secret_word_md5.upcase, mb_amount.to_s, mb_currency.to_s, status.to_s]
    end
  end
end
