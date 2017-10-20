# frozen_string_literal: true

class PostRepo < ROM::Repository[:posts]
  delegate :to_a, to: :posts

  def all_for_user(user_id)
    posts.where(user_id: user_id).to_a
  end

  def all_for_ids(ids)
    posts.where(id: ids).to_a
  end
end
