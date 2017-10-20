# frozen_string_literal: true

UserType = GraphQL::ObjectType.define do
  name "User"
  field :email, types.String
  field :username, types.String
  field :posts, types[PostType], resolve: ->(user, _, _) do
    BatchLoader.for(user.id).batch do |user_ids, loader|
      grouped_hash = Container.instance["repositories.post"].all_for_user(user_ids).group_by(&:user_id)
      user_ids.each { |user_id| loader.call(user_id, grouped_hash[user_id]) }
    end
  end
  field :comments, types[CommentType], resolve: ->(user, _, _) do
    BatchLoader.for(user.id).batch do |author_ids, loader|
      grouped_hash = Container.instance["repositories.comment"].all_for_author(author_ids).group_by(&:author_id)
      author_ids.each { |author_id| loader.call(author_id, grouped_hash[author_id]) }
    end
  end
end
