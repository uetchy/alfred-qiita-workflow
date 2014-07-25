$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'qiita/config'
require 'qiita/api'
require 'qiita/alfred'
require 'qiita/version'
