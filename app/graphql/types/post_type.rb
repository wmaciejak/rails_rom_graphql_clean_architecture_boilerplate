# frozen_string_literal: true

PostType = GraphQL::ObjectType.define do
  name "Post"
  field :id, !types.ID
  field :content, !types.String
  field :title, !types.String
  field :created_at, !types.String
  field :updated_at, !types.String
  field :comments, types[CommentType], resolve: Post::Resolvers::Comments.new
end
