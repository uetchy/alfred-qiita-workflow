# encoding: utf-8
require 'time'

QUERY = ARGV[0].to_s.strip

require_relative "../lib/qiita"

data = Qiita::API.search(QUERY)
data.sort! {|a, b| b['stock_count'] <=> a['stock_count'] }

results = []
data.each do |q|
  arg = q['url']
  subtitle = q['stock_count'].to_s + " Stocks, " + q['comment_count'].to_s + " Comments, " + Time.parse(q['created_at']).strftime("%Y/%m/%d %H:%M:%S") + " Created"

  item = {
    :uid => nil,
    :arg => arg,
    :title => q['title'],
    :subtitle => subtitle,
    :icon => 'icon.png'
  }
  results << item
end

puts Qiita::Alfred.to_alfred(results)
