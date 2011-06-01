require "net/http"
require "net/https"
require "uri"

module Moneybookers
  class Request
    attr_reader :response, :path

    def http
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end

    def uri
      @uri ||= URI.parse(Moneybookers::HOST)
    end

    def post(to, params={})
      @path = URI.parse(to).path
      @response = http.post(path, prepare_params(params), headers)
    end

    def prepare_params(params)
      params.map { |k, v| "#{k}=#{v}" }.join("&")
    end

    def headers
      {"User-Agent" => "ruby-moneybookers-gem"}
    end
  end
end
