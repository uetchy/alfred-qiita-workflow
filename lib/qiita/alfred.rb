require 'rexml/document'

module Qiita::Alfred
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

  def self.message(str)
    puts Qiita::Alfred.to_alfred([{ uid: 0, arg: nil, title: str, subtitle: nil, icon: 'icon.png'}])
  end
end