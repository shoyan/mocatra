$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mocatra'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../lib/mocatra.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Mocatra::App end
end

RSpec.configure { |c| c.include RSpecMixin }
