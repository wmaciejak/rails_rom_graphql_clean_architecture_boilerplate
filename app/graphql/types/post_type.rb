# frozen_string_literal: true

PostType = GraphQL::ObjectType.define do
  name "Post"
  field :id, !types.ID
  field :content, !types.String
  field :title, !types.String
  field :created_at, !types.String
  field :updated_at, !types.String
  field :comments, CommentType, resolve: ->(post, _, _) do
    BatchLoader.for(post.id).batch do |post_ids, loader|
      CommentRepo.new(ROM.env).all_for_posts(post_ids).each do |comment|
        loader.call(comment.post_id, comment)
      end
    end
  end
end
