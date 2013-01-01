require 'lotus/router'

module Lotus
  class Application
    def initialize(router)
      @router = router
    end

    def call(env)
      @router.call(env)
    end
  end
end
