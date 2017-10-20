# frozen_string_literal: true

PostType = GraphQL::ObjectType.define do
  name "Post"
  field :id, !types.ID
  field :content, !types.String
  field :title, !types.String
  field :created_at, !types.String
  field :updated_at, !types.String
  field :comments, types[CommentType], resolve: ->(post, _, _) do
    BatchLoader.for(post.id).batch do |post_ids, loader|
      grouped_hash = Container.instance["repositories.comment"].all_for_posts(post_ids).group_by(&:post_id)
      post_ids.each { |post_id| loader.call(post_id, grouped_hash[post_id]) }
    end
  end
end
