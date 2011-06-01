# Moneybookers #
Ruby client for [Moneybookers](http://moneybookers.com/) service.

Refer to Moneybookers documentation:
 * [Automated Payment Interface](http://www.moneybookers.com/merchant/pl/automated_payments_interface_manual.pdf)
 * [Payment Gateway](http://www.moneybookers.com/merchant/pl/moneybookers_gateway_manual.pdf)

## Configuration ##

``` ruby
require "moneybookers"

Moneybookers.configure do |config|
  config.merchant_id     = "merchant_id"
  config.email           = "john@doe.com"
  config.secret_word_md5 = "md5-of-secret-word"
  config.password        = "md5-of-password"
  config.pay_to_email    = "joe@doe.com"
end
```

## Payment Gateway ##

## API ##

### Pay On Demand ##

## TODO: ##
* Support rest of API
* More tests
* Docs

## Copyright ##

Copyright © 2011 Wojciech Wnętrzak. See LICENSE for details.
