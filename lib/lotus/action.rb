module Lotus
  class Action
    LOTUS_CONTROLLER = 'lotus.controller'.freeze
    LOTUS_ACTION     = 'lotus.action'.freeze

    def initialize(options)
      @controller_name = options.fetch(:controller)
      @name            = options.fetch(:action) {|e| :index }
    end

    def call(env)
      prepare!(env)
      controller.call(name)
    end

    private
    attr_reader :name

    def controller
      @controller ||= constantize_controller_name.new(@env)
    end

    def constantize_controller_name
      Object.const_get "#{ @controller_name.to_s.capitalize }Controller"
    end

    def prepare!(env)
      @env = env

      @env[LOTUS_CONTROLLER] = controller
      @env[LOTUS_ACTION]     = name
    end
  end
end
