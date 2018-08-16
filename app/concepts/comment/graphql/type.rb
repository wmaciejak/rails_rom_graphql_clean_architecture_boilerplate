# frozen_string_literal: true

module Comment
  module Graphql
    Type = GraphQL::ObjectType.define do
      name "Comment"
      field :id, !types.ID
      field :content, !types.String
      field :created_at, !types.String
      field :updated_at, !types.String
      field :author, User::Graphql::Type, resolve: Comment::Graphql::Resolvers::Authors.new
      field :post, Post::Graphql::Type, resolve: Comment::Graphql::Resolvers::Posts.new
    end
  end
end
