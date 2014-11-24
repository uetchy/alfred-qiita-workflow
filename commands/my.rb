# encoding: utf-8
require 'time'

QUERY = ARGV[0].to_s.strip

require_relative "../lib/qiita"

begin
  config = Qiita::Config.new
rescue Qiita::FileMissingError
  # Create empty config file if it doesn't exist
  config.save
end

# 'my' command needs Qiita API Token
unless config.token
  Qiita::Alfred.message "RUN: 'qiita setup' command first"
  exit
end

data = Qiita::API.get(:items, :token => config.token)
data.select!{|a| a['title'].scan(QUERY).size > 0 } if QUERY

results = Qiita::Alfred.messages(data)

puts Qiita::Alfred.to_alfred(results)
