# frozen_string_literal: true

module QueryTypes
  Post = GraphQL::ObjectType.define do
    field :post do
      type PostType
      argument :id, !types.ID
      description "Find a Post by ID"
      resolve ->(_obj, args, _ctx) { Container.instance["repositories.post"].one(args["id"]) }
    end

    field :posts do
      type !types[PostType]
      resolve ->(_obj, _args, _ctx) { Container.instance["repositories.post"].to_a }
    end
  end
end
