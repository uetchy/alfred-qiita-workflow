QUERY = ARGV[0].to_s.strip

require_relative "../lib/qiita"

credentials = QUERY.split(/\s/)

unless credentials.count == 2
  puts "RUN: qiita setup <NAME> <PASSWORD>"
  exit
end

auth = Qiita::API.auth name: credentials.first, password: credentials.last

unless auth
  puts "ERROR: Authentication failed"
  exit
end

config = Qiita::Config.new name: auth['url_name'], token: auth['token']
config.save 

puts "Setup complete"