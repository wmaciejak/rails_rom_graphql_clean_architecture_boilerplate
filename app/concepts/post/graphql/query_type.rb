# frozen_string_literal: true

module Post
  module Graphql
    QueryType = GraphQL::ObjectType.define do
      field :post do
        type Type
        argument :id, !types.ID
        description "Find a Post by ID"
        resolve ->(_obj, args, _ctx) { Container.instance["repositories.post"].one(args["id"]) }
      end

      field :posts do
        type !types[Type]
        resolve ->(_obj, _args, _ctx) { Container.instance["repositories.post"].to_a }
      end
    end
  end
end
