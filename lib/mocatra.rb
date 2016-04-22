require "mocatra/version"
require 'sinatra/base'
require 'mocatra/record'

module Mocatra
  class App < Sinatra::Base
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
      if Record.exist?(request.path_info)
        record = Record.sing(request.path_info)
        status record['status']
        record['body'].to_s
      else
        status 404
        {"version"=>"1", "result"=>"not found"}.to_s
      end
    end
  end
end
