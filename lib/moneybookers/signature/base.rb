require "digest/md5"

module Moneybookers::Signature
  class Base
    attr_accessor :merchant_id, :transaction_id, :secret_word_md5

    def initialize(params={})
      self.merchant_id = params.fetch(:merchant_id, Moneybookers.merchant_id) || raise(ArgumentError, "No merchant_id given")
      self.secret_word_md5 = params.fetch(:secret_word_md5, Moneybookers.secret_word_md5) || raise(ArgumentError, "No secret_word_md5 given")
      self.transaction_id = params[:transaction_id] || raise(ArgumentError, "No transaction_id given")
    end

    def to_s
      Digest::MD5.hexdigest(params.join).upcase
    end

    def match?(signature)
      to_s == signature
    end
  end
end
