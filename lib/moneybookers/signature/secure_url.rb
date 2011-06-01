module Moneybookers::Signature
  class SecureUrl < Base
    def params
      [merchant_id.to_s, transaction_id.to_s, secret_word_md5.upcase]
    end
  end
end
