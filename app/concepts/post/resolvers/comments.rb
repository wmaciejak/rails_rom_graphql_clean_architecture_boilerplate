# frozen_string_literal: true

module Post
  module Resolvers
    class Comments < Utils::BaseResolver
      batch_load mode: :many, key: :post_id, fetch_method: :all_for_posts, cache: false
      repository :comment
    end
  end
end
