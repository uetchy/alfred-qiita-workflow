# encoding: utf-8
require 'time'

QUERY = ARGV[0].to_s.strip

require_relative "../lib/qiita"

begin
  config = Qiita::Config.new
rescue Qiita::FileMissingError
  config.save
end

unless config.token
  Qiita::Alfred.message "RUN: 'qiita setup' command first"
  exit
end

data = !QUERY.empty? ? Qiita::API.search(QUERY, :token => config.token, :stocked => 1) : Qiita::API.get(:stocks, :token => config.token)
data.sort! {|a, b| b['stock_count'] <=> a['stock_count'] }

results = []
data.each do |q|
  subtitle = q['stock_count'].to_s + " Stocks, " + q['comment_count'].to_s + " Comments, " + Time.parse(q['created_at']).strftime("%Y/%m/%d %H:%M:%S") + " Created"

  item = {
    :uid => nil,
    :arg => q['url'],
    :title => q['title'],
    :subtitle => subtitle,
    :icon => 'icon.png'
  }

  results << item
end

puts Qiita::Alfred.to_alfred(results)
