# frozen_string_literal: true

UserType = GraphQL::ObjectType.define do
  name "User"
  field :email, types.String
  field :username, types.String
  field :posts, types[PostType], resolve: User::Resolvers::Posts.new
  field :comments, types[CommentType], resolve: User::Resolvers::Comments.new
end
