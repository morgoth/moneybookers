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
end
```

NOTE: You can create md5 of your credentials by:

``` ruby
require "digest/md5"
Digest::MD5.hexdigest("your-secret-word")
```

## Payment Gateway ##

You can prepare payment gateway form by sending params and retrieving session_id (that will be used in rendering form).

``` ruby
client = Moneybookers::PaymentGateway::Client.new({})
client.prepare
client.session_id
```
Having session_id you can render moneybookers form from url:

```
https://www.moneybookers.com/app/payment.pl?sid=prepared-session-id-from-previous-request
```

## API ##

NOTE: To use Moneybookers API you must add your IP address to allowed, through moneybookers admin panel.

### Pay On Demand ##

When user accepted pay on demand option during transaction authorisation, you can charge him by using pay on demand interface.

``` ruby
client = Moneybookers::API::PayOnDemand.new(:amount => 10, :currency => "EUR", :rec_payment_id => 123)
client.prepare
client.request
```
This is done in 2 steps.

1. Preparing transaction and retrieving session_id (prepare)
2. Charging user (request)

## Transaction Confirmation ##

Moneybookers can send confirmation of each transaction (when status_url was specified).
Those requests will be sent from theirs IP pool, that are available by:

``` ruby
Moneybookers::SERVICE_IPS
```

NOTE: you should always check if this IPs are still accurate by contacting Moneybookers support.

## TODO: ##
* Support rest of API
* More tests
* Docs

## Copyright ##

Created during development for [Ragnarson](http://ragnarson.com/)

Copyright © 2011 Wojciech Wnętrzak. See LICENSE for details.
