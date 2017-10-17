# frozen_string_literal: true

module Utils
  class CombineFields
    def self.call(query_types)
      Array(query_types).inject({}) do |acc, query_type|
        acc.merge!(query_type.fields)
      end
    end
  end
end
