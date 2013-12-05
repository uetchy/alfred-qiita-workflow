class Qiita::Object
  def initialize(attributes={})
    self.attributes_with!(attributes)
  end

  def attributes_with!(attributes={})
    attributes.each do |key, value|
      self.send(key.to_s+"=", value) if self.respond_to?(key.to_s+"=")
    end
  end

  def to_hash(flatten=false)
    hash = {}
    self.instance_variables.each do |var| 
      value = self.instance_variable_get(var)
      hash[var[1..-1].to_sym] = value
    end
    hash
  end

  def to_json(flatten=false)
    self.to_hash(flatten).to_json
  end
end