require 'rack/request'
require 'rack/response'

module Lotus
  class Controller
    VERSION = '0.0.1'

    def initialize(env)
      @request, @response = Rack::Request.new(env), Rack::Response.new
    end

    def call(action)
      send(action)
      response.finish
    end

    def name
      self.class.name.gsub(/Controller$/, '').downcase
    end

    private
    attr_reader :request, :response
  end
end
