require 'rack/request'
require 'rack/response'

module Lotus
  class Controller
    VERSION = '0.0.1'

    def initialize(env)
      @request = Rack::Request.new(env)
    end

    def call(action)
      send(action)
      response.finish
    end

    private
    attr_reader :request

    def response
      @response ||= Rack::Response.new
    end
  end
end
