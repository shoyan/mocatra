require 'yaml'

module Mocatra
  class Record

    class << self
      def exist?(record)
        record += 'index' if record =~ /\/$/
        File.exist?("#{Mocatra::App.record_path}/#{record}.yml")
      end

      def default_song
        path = "#{Mocatra::App.record_path}/index.yml"
        YAML.load(File.read(path))
      end

      def sing(record)
        record += 'index' if record =~ /\/$/
        path = "#{Mocatra::App.record_path}/#{record}.yml"
        YAML.load(File.read(path))
      end
    end
  end
end
