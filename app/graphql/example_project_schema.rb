# frozen_string_literal: true

ExampleProjectSchema = GraphQL::Schema.define do
  query QueryType
  use BatchLoader::GraphQL
end
