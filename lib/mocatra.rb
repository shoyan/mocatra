require "mocatra/version"
require 'sinatra/base'
require 'mocatra/record'
require 'json'

module Mocatra
  class App < Sinatra::Application
    set :bind, '0.0.0.0'

    def self.record_path
      @record_path || File.expand_path("../../records", __FILE__)
    end

    def self.record_path=(path)
      @record_path = path
    end

    get '*' do
      my_song(request)
    end

    post '*' do
      my_song(request)
    end

    put '*' do
      my_song(request)
    end

    patch '*' do
      my_song(request)
    end

    delete '*' do
      my_song(request)
    end

    def my_song(request)
      if request.content_type =~ /json/
        json = JSON.parse request.body.read
        request.path_info = json["method"]
      end

      logger.info path: request.path_info, parameters: json || request.body.read

      if Record.exist?(request.path_info)
        record = Record.sing(request.path_info)
        status record['status']
        record['body'].to_json
      else
        status 404
      end
    end

    not_found do
      {"version"=>"1", "result"=>"not found"}.to_json
    end
  end
end
