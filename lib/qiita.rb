module Qiita
  BUNDLE_ID = 'co.randompaper.qiita.alfred'

  CONFIG_FILE = File.expand_path("~/Library/Application Support/Alfred 2/Workflow Data/#{BUNDLE_ID}/config.json")
  CACHE_DIR   = File.expand_path("~/Library/Caches/com.runningwithcrayons.Alfred-2/Workflow Data/#{BUNDLE_ID}")
end

require_relative 'qiita/version.rb'
require_relative 'qiita/object.rb'
require_relative 'qiita/config.rb'
require_relative 'qiita/api.rb' 
require_relative 'qiita/alfred.rb'