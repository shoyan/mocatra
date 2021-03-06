require 'spec_helper'

describe Mocatra do
  it 'has a version number' do
    expect(Mocatra::VERSION).not_to be nil
  end

  it "returns ok" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq({"version"=>"1", "result"=>"OK"}.to_json)
  end

  it "returns 404 not found" do
    get '/user'
    expect(last_response.status).to eq 404
    expect(last_response.body).to eq({"version"=>"1", "result"=>"not found"}.to_json)
  end

  context "when content type is application/json" do
    it "returns ok" do
      header "CONTENT_TYPE", "application/json"
      post('/', "{\"version\":1.1,\"method\":\"index\",\"params\":{\"account\":\"hoge\"}}")
      expect(last_response).to be_ok
      expect(last_response.body).to eq({"version"=>"1", "result"=>"OK"}.to_json)
    end
  end

  describe ".record_path" do
    it "returns the record_path" do
      expect(Mocatra::App.record_path).to eq File.expand_path("../../records", __FILE__)
    end
  end

  describe ".record_path=" do
    it "sets the record_path" do
      Mocatra::App.record_path = "./mocs"
      expect(Mocatra::App.record_path).to eq "./mocs"
    end
  end
end
