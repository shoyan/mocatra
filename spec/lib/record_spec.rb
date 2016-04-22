require 'spec_helper'
require 'fileutils'

describe Mocatra::Record do
  before (:all) do
    Dir.mkdir("./records/user") unless Dir.exist?("./records/user")
    File.new("./records/user/index.yml", "w")
    File.new("./records/user/introduce.json.yml", "w")
  end
  after(:all) do
    FileUtils.remove_dir("./records/user")
  end

  describe ".default_song" do
    it "returns default_song" do
      expect(described_class.default_song).to eq({"status"=>200, "body"=>{"version"=>"1", "result"=>"OK"}})
    end
  end

  describe ".sing" do
    it "returns lyrics(hash)" do
      expect(described_class.sing('index')).to eq({"status"=>200, "body"=>{"version"=>"1", "result"=>"OK"}})
      expect(described_class.sing('/')).to eq({"status"=>200, "body"=>{"version"=>"1", "result"=>"OK"}})
    end
  end

  describe ".exist?" do
    it "returns true if the named file exists" do
      aggregate_failures("verifying response") do
        expect(described_class.exist?('/')).to be true
        expect(described_class.exist?('index')).to be true
        expect(described_class.exist?('user/')).to be true
        expect(described_class.exist?('user/introduce.json')).to be true
      end
    end

    it "returns false unless the named file exists" do
      aggregate_failures("verifying response") do
        expect(described_class.exist?('notexist')).to be false
        expect(described_class.exist?('user/notexist')).to be false
      end
    end
  end
end
