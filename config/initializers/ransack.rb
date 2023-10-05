module Ransack
  module Adapters
    module ActiveRecord
      class Context
        def type_for(attr)
          return nil unless attr&.valid?
          relation = attr.arel_attribute.relation
          name = attr.arel_attribute.name.to_s
          table = relation.respond_to?(:table_name) ? relation.table_name : relation.name
          schema_cache = klass.connection.schema_cache
          unless schema_cache.send(:data_source_exists?, table)
            raise "No table named #{table} exists."
          end
          attr.klass.columns.find { |column| column.name == name }.type
        end
      end
    end
  end
end
