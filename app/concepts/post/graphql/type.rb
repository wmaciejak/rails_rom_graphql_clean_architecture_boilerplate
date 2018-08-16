# frozen_string_literal: true

module Post
  module Graphql
    Type = GraphQL::ObjectType.define do
      name "Post"
      field :id, !types.ID
      field :content, !types.String
      field :title, !types.String
      field :created_at, !types.String
      field :updated_at, !types.String
      field :comments, types[Comment::Graphql::Type], resolve: Post::Graphql::Resolvers::Comments.new
    end
  end
end
