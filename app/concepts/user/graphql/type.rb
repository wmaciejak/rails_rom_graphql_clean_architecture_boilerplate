# frozen_string_literal: true

module User
  module Graphql
    Type = GraphQL::ObjectType.define do
      name "User"
      field :email, types.String
      field :username, types.String
      field :posts, types[Post::Graphql::Type], resolve: User::Graphql::Resolvers::Posts.new
      field :comments, types[Comment::Graphql::Type], resolve: User::Graphql::Resolvers::Comments.new
    end
  end
end
