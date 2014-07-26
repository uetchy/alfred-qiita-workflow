# encoding: utf-8

require 'net/https'
require 'uri'
require 'json'

module Qiita
  class API

    ENDPOINT = "https://qiita.com/api/v1/"

    def self.fetch(uri, params={}, *args)
      defaults = { method: :get, limit: 10 }
      opt = args.last.kind_of?(Hash)? defaults.update(args.pop) : defaults
      raise ArgumentError, 'too many HTTP redirects' if opt[:limit] == 0

      if opt[:method] == :get
        uri.query = URI.encode_www_form(params) if params
        request = Net::HTTP::Get.new(uri.request_uri)
      else
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(params)
      end

      response = Net::HTTP.start(
                   uri.host,
                   uri.port,
                   :use_ssl => (uri.scheme == 'https'),
                   :verify_mode => OpenSSL::SSL::VERIFY_NONE
                 ) do |https|
        https.request(request)
      end

      case response
      when Net::HTTPSuccess

        if(response.class.body_permitted?)
          begin
            JSON(response.body)
          rescue JSON::ParserError
            false
          end
        else
          false
        end

      when Net::HTTPRedirection
        location = response['location']
        fetch(location, limit - 1)
      when Net::HTTPUnauthorized
        false
      else
        response.value
      end
    end

    def self.get(path, args={})
      uri = URI.join(ENDPOINT, path.to_s)
      fetch uri, args
    end

    def self.post(path, args={})
      uri = URI.join(ENDPOINT, path.to_s)
      fetch uri, args, method: :post
    end

    def self.auth(name, password)
      uri = URI.join(ENDPOINT, 'auth')
      params = {:url_name => name, :password => password}
      fetch uri, params, method: :post
    end

    def self.search(query, args={})
      uri = URI.join(ENDPOINT, 'search')
      fetch uri, {:q => query}.update(args)
    end
  end
end
