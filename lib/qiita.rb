module Qiita
  VERSION = '1.0'
  BUNDLE_ID = 'co.randompaper.qiita.alfred'

  CONFIG_FILE = File.expand_path("~/Library/Application Support/Alfred 2/Workflow Data/#{BUNDLE_ID}/config.json")
  CACHE_DIR   = File.expand_path("~/Library/Caches/com.runningwithcrayons.Alfred-2/Workflow Data/#{BUNDLE_ID}")

  class FileMissingError < StandardError; end
end

require_relative 'qiita/object.rb'
require_relative 'qiita/config.rb'
require_relative 'qiita/api.rb' 
require_relative 'qiita/alfred.rb'