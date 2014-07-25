# encoding: utf-8

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

data = Qiita::API.search(QUERY, token: config.token, stocked: 1)

results = []
data.each do |q|
  subtitle = "Stocks: " + q['stock_count'].to_s + "    LGTM:" + q['lgtm_count'].to_s + "   Comments:" + q['comment_count'].to_s + "   Create At:" + q['created_at']

  item = {
    uid: q['id'],
    arg: q['url'],
    title: q['title'],
    subtitle: subtitle,
    icon: 'icon.png'
  }

  results << item
end

puts Qiita::Alfred.to_alfred(results)
