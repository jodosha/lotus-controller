require 'rack/mount'
require 'lotus/action'

module Lotus
  class Router < Rack::Mount::RouteSet
    def self.draw(&blk)
      new.tap {|r| r.instance_eval(&blk) }.finalize!
    end

    def finalize!
      freeze
    end

    private
    def get(path, options = {})
      add_route Lotus::Action.new(options), { request_method: 'GET', path_info: %r{^#{ path }$} }, options
    end
  end
end
