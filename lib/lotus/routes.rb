require 'rack/mount'
require 'lotus/action'

module Lotus
  class Routes < Rack::Mount::RouteSet
    def self.draw(&blk)
      new.tap {|r| r.instance_eval(&blk) }.finalize!
    end

    def finalize!
      freeze
      self
    end

    private
    def get(path, options = {})
      add_route Lotus::Action.new(options), { request_method: 'GET', path_info: %r{^#{ path }$} }, options
    end
  end
end
