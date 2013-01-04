require 'lotus/routes'

module Lotus
  class App
    def initialize(routes)
      @routes = routes
    end

    def call(env)
      @routes.call(env)
    end
  end
end
