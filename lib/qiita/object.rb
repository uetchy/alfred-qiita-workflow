class Qiita::Object
  def initialize(attributes={})
    self.attributes_with!(attributes)
  end

  def attributes_with!(attributes={})
    attributes.each do |key, value|
      self.send(key.to_s+"=", value) if self.respond_to?(key.to_s+"=")
    end
  end
end