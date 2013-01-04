require 'lotus/router'

module Lotus
  class App
    def initialize(router)
      @router = router
    end

    def call(env)
      @router.call(env)
    end
  end
end
