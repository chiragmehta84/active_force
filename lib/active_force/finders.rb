module ActiveForce
  module Finders
    module ClassMethods
      def find_by conditions
        query = self.query
        query_conditions(conditions).each do |query_condition|
          query = query.where query_condition
        end
        send_query(query).first
      end

      private

      #maps a hash key => value to a string 'key = value'
      def query_conditions conditions
        conditions.map do |key, value|
          "#{ mappings[key] } = #{ enclose_value value }"
        end
      end

      def enclose_value value

      end

    end

    def self.included mod
      mod.extend ClassMethods
    end

  end
end
