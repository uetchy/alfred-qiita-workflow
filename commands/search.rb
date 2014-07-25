# encoding: utf-8

QUERY = ARGV[0].to_s.strip

require_relative "../lib/qiita"

data = Qiita::API.search(QUERY)

results = []
data.each do |q|
  arg = q['url']
  subtitle = "Stocks: " + q['stock_count'].to_s + "    LGTM:" + q['lgtm_count'].to_s + "   Comments:" + q['comment_count'].to_s + "   Create At:" + q['created_at']

  item = { uid: q['id'], arg: arg, title: q['title'], subtitle: subtitle, icon: 'icon.png'}
  results << item
end

puts Qiita::Alfred.to_alfred(results)
