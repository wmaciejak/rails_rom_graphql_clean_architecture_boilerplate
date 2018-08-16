# frozen_string_literal: true

module Comment
  module Graphql
    QueryType = GraphQL::ObjectType.define do
      field :comment do
        type Type
        argument :id, !types.ID
        description "Find a Comment by ID"
        resolve ->(_obj, args, _ctx) { Container.instance["repositories.comment"].one(args["id"]) }
      end

      field :comments do
        type !types[Type]
        resolve ->(_obj, _args, _ctx) { Container.instance["repositories.comment"].to_a }
      end
    end
  end
end
