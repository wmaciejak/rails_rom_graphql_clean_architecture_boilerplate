# frozen_string_literal: true

CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :content, !types.String
  field :created_at, !types.String
  field :updated_at, !types.String
  field :author, UserType, resolve: Comment::Resolvers::Authors.new
  field :post, PostType, resolve: Comment::Resolvers::Posts.new
end
