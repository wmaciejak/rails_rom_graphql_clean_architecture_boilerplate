# frozen_string_literal: true

module QueryTypes
  Comment = GraphQL::ObjectType.define do
    field :comment do
      type CommentType
      argument :id, !types.ID
      description "Find a Comment by ID"
      resolve ->(_obj, args, _ctx) { CommentRepo.new(ROM.env).one(args["id"]) }
    end

    field :comments do
      type !types[CommentType]
      resolve ->(_obj, _args, _ctx) { CommentRepo.new(ROM.env).to_a }
    end
  end
end
