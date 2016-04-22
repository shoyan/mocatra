require 'spec_helper'

describe Mocatra do
  it 'has a version number' do
    expect(Mocatra::VERSION).not_to be nil
  end

  it "returns ok" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq({"version"=>"1", "result"=>"OK"}.to_s)
  end

  it "returns ok" do
    get '/user'
    expect(last_response.status).to eq 404
    expect(last_response.body).to eq({"version"=>"1", "result"=>"not found"}.to_s)
  end
end
