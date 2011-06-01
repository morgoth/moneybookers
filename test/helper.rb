require "minitest/autorun"
require "fakeweb"

require "moneybookers"

class MiniTest::Unit::TestCase
  def setup
    FakeWeb.allow_net_connect = false
  end
end
