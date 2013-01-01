module Lotus
  class Controller
    class InstanceVariablesSet < Hash
      def initialize(object)
        @object = object

        super()
        merge! extract
      end

      private
      def extract
        variables.inject({}) do |result, var|
          result[variable_name(var)] = variable_value(var)
          result
        end
      end

      def variables
        @object.instance_variables
      end

      def variable_name(var)
        var.to_s.gsub(/^@/, '').to_sym
      end

      def variable_value(var)
        @object.instance_variable_get(var)
      end
    end
  end
end
