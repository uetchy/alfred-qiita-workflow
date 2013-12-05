require 'net/https'
require 'uri'
require 'json'

module Qiita::API
  def self.search(query)
    uri = URI('https://qiita.com/api/v1/search')
    params = {q: query}
    uri.query = URI.encode_www_form(params)
    res = fetch(uri)
    JSON(res.body)
  end

  def self.fetch(uri, limit = 10)
    raise ArgumentError, 'too many HTTP redirects' if limit == 0

    response = Net::HTTP.get_response(uri)

    case response
    when Net::HTTPSuccess then
      response
    when Net::HTTPRedirection then
      location = response['location']
      fetch(location, limit - 1)
    else
      response.value
    end
  end
end