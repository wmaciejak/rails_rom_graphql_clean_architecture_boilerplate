# frozen_string_literal: true
module Comment
  class Repository < ROM::Repository[:comments]
    delegate :to_a, to: :comments

    def all_for_author(author_id)
      comments.where(author_id: author_id).to_a
    end

    def all_for_posts(post_id)
      comments.where(post_id: post_id).to_a
    end
  end
end
