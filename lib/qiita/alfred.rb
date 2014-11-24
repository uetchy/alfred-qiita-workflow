# encoding: utf-8

require 'rexml/document'

module Qiita
  module Alfred
    def self.to_alfred(array)
      raise "Argument must be an Array" unless array.kind_of? Array

      doc = REXML::Document.new
      root = doc.add_element("items")

      array.each do |entry|
        item = root.add_element("item")

        entry.each do |key, value|
          if [:uid, :arg, :valid, :autocomplete].include?(key)
            item.attributes[key.to_s] = value.to_s
          else
            element = item.add_element(key.to_s)
            element.text = value ? value.to_s : ""
          end
        end
      end

      doc.to_s
    end

    def self.messages(texts_array)
      results = []
      texts_array.each do |q|
        subtitle = q['stock_count'].to_s + " Stocks, " + q['comment_count'].to_s + " Comments, " + Time.parse(q['created_at']).strftime("%Y/%m/%d %H:%M:%S") + " Created"

        item = {
          :uid => nil,
          :arg => q['url'],
          :title => q['title'],
          :subtitle => subtitle,
          :icon => 'icon.png'
        }

        results << item
      end

      return results
    end

    def self.message(str)
      puts Qiita::Alfred.to_alfred([{
        :uid => 0,
        :arg => nil,
        :title => str,
        :subtitle => nil,
        :icon => 'icon.png'
      }])
    end
  end
end
