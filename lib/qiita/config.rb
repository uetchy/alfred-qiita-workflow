require 'json'
require 'fileutils'

class Qiita::Config < Qiita::Object
  def initialize(attributes={})
    attributes.empty? ? self.load! : self.update!(attributes)
  end

  def load!(file_path="")
    file_path = Qiita::CONFIG_FILE if file_path.empty?

    begin
      File.open(file_path, 'r') {|f| self.update!(JSON(f.read))}
    rescue Errno::ENOENT, IOError
      raise Qiita::ConfigFileMissingError, "Run Qiita command format: qiita <QUERY>"
    end
  end

  def save(file_path="")
    file_path = Qiita::CONFIG_FILE if file_path.empty?

    FileUtils.mkpath(File.dirname(file_path))
    File.open(file_path, 'w') {|f| f.puts self.to_json }
  end

  def update!(attributes={})
    attributes_with!(attributes)
  end
end