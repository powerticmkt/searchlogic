module Searchlogic
  module Conditions
    class DoesNotEndWith < Condition
      def scope
        klass.where("#{table_name}.#{column_name} not like ?", "%#{value}") if applicable? 
      end

      private
        def value
          args.first
        end

        def applicable? 
          !(/^(#{klass.column_names.join("|")})_does_not_end_with$/ =~ method_name).nil? if klass
        end
    end
  end
end