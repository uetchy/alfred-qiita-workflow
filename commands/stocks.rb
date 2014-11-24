# encoding: utf-8
require 'time'

QUERY = ARGV[0].to_s.strip

require_relative "../lib/qiita"

begin
  config = Qiita::Config.new
rescue Qiita::FileMissingError
  config.save
end

# 'stocks' command needs Qiita API Token
unless config.token
  Qiita::Alfred.message "RUN: 'qiita setup' command first"
  exit
end

data = !QUERY.empty? ? Qiita::API.search(QUERY, :token => config.token, :stocked => 1) : Qiita::API.get(:stocks, :token => config.token)
data.sort! {|a, b| b['stock_count'] <=> a['stock_count'] }

results = Qiita::Alfred.messages(data)

puts Qiita::Alfred.to_alfred(results)
