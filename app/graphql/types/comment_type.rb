# frozen_string_literal: true

CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :content, !types.String
  field :created_at, !types.String
  field :updated_at, !types.String
  field :author, UserType, resolve: ->(comment, _, _) do
    BatchLoader.for(comment.author_id).batch do |author_ids, loader|
      Container.instance["repositories.user"].all_for_ids(author_ids).each { |user| loader.call(user.id, user) }
    end
  end
  field :post, PostType, resolve: ->(comment, _, _) do
    BatchLoader.for(comment.post_id).batch do |post_ids, loader|
      Container.instance["repositories.post"].all_for_ids(post_ids).each { |post| loader.call(post.id, post) }
    end
  end
end
