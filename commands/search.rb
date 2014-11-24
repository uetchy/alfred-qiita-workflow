# encoding: utf-8
require 'time'

QUERY = ARGV[0].to_s.strip

require_relative "../lib/qiita"

data = Qiita::API.search(QUERY)
data.sort! {|a, b| b['stock_count'] <=> a['stock_count'] }

results = Qiita::Alfred.messages(data)

puts Qiita::Alfred.to_alfred(results)
