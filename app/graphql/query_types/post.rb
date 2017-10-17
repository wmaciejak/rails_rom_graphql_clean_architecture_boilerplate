# frozen_string_literal: true

module QueryTypes
  Post = GraphQL::ObjectType.define do
    field :post do
      type PostType
      argument :id, !types.ID
      description "Find a Post by ID"
      resolve ->(_obj, args, _ctx) { PostRepo.new(ROM.env).one(args["id"]) }
    end

    field :posts do
      type !types[PostType]
      resolve ->(_obj, _args, _ctx) { PostRepo.new(ROM.env).to_a }
    end
  end
end
