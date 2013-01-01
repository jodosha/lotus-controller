module Lotus
  class Action
    def initialize(options)
      @controller = constantize(options.fetch(:controller))
      @action     = options.fetch(:action) {|e| :index }
    end

    def call(env)
      @controller.new(env).call(@action)
    end

    private
    def constantize(controller)
      Object.const_get "#{ controller.to_s.capitalize }Controller"
    end
  end
end
