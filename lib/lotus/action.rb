module Lotus
  class Action
    def initialize(options)
      @controller_name = options.fetch(:controller)
      @action          = options.fetch(:action) {|e| :index }
    end

    def call(env)
      controller.new(env).call(@action)
    end

    private
    def controller
      @controller ||= constantize_controller_name
    end

    def constantize_controller_name
      Object.const_get "#{ @controller_name.to_s.capitalize }Controller"
    end
  end
end
