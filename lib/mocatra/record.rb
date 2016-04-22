require 'yaml'

module Mocatra
  class Record
    class << self
      def exist?(record)
        record += 'index' if record =~ /\/$/
        File.exist?(File.expand_path("../../../records/#{record}.yml", __FILE__))
      end

      def default_song
        path = File.expand_path("../../../records/index.yml", __FILE__)
        YAML.load(File.read(path))
      end

      def sing(record)
        record += 'index' if record =~ /\/$/
        path = File.expand_path("../../../records/#{record}.yml", __FILE__)
        YAML.load(File.read(path))
      end
    end
  end
end
