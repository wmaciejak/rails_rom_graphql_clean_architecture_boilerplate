# frozen_string_literal: true

UserType = GraphQL::ObjectType.define do
  name "User"
  field :email, types.String
  field :username, types.String
  field :posts, PostType, resolve: ->(user, _, _) do
    BatchLoader.for(user.id).batch do |user_ids, loader|
      PostRepo.new(ROM.env).all_for_user(user_ids).each do |post|
        loader.call(post.user_id, post)
      end
    end
  end
  field :comments, CommentType, resolve: ->(user, _, _) do
    BatchLoader.for(user.id).batch do |user_ids, loader|
      CommentRepo.new(ROM.env).all_for_author(user_ids).each do |comment|
        loader.call(comment.author_id, comment)
      end
    end
  end
end
