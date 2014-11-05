# encoding: utf-8

require 'json'
require 'fileutils'
require 'ostruct'

module Qiita

  BUNDLE_ID   = 'co.randompaper.qiita.alfred'
  CONFIG_FILE = File.expand_path("~/Library/Application Support/Alfred 2/Workflow Data/#{BUNDLE_ID}/config.json")
  CACHE_DIR   = File.expand_path("~/Library/Caches/com.runningwithcrayons.Alfred-2/Workflow Data/#{BUNDLE_ID}")

  class FileMissingError < StandardError; end

  class Config < OpenStruct
    def initialize(attributes={})
      super(attributes)
      attributes.empty? ? self.load! : self.update!(attributes)
    end

    def load!(file_path="")
      file_path = Qiita::CONFIG_FILE if file_path.empty?

      begin
        File.open(file_path, 'r') do |f|
          self.marshal_load(symbolize_keys(JSON(f.read)))
        end
      rescue Errno::ENOENT, IOError
        raise Qiita::FileMissingError
      end
    end

    def update!(attributes={})
      attributes_with!(attributes)
    end

    def attributes_with!(attributes={})
      attributes.each do |key, value|
        self.send(key.to_s+"=", value) if self.respond_to?(key.to_s+"=")
      end
    end

    def save(file_path="")
      file_path = Qiita::CONFIG_FILE if file_path.empty?

      FileUtils.mkpath(File.dirname(file_path))
      File.open(file_path, 'w') {|f| f.puts self.to_json }
    end

    def to_hash
      table.to_h
    end

    def to_json
      table.to_json
    end

    private

    def symbolize_keys(hash)
      hash.inject({}){|res, (k,v)| res[k.to_sym] = v; res}
    end
  end

end
