# frozen_string_literal: true

module Comment
  module Graphql
    module Resolvers
      class Posts < Utils::BaseResolver
        batch_load mode: :single, key: :post_id, fetch_method: :all_for_ids, cache: false
        repository :post
      end
    end
  end
end
