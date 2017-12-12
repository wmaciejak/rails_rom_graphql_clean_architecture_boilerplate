# frozen_string_literal: true

module Comment
  module Resolvers
    class Authors < Utils::BaseResolver
      batch_load mode: :single, key: :author_id, fetch_method: :all_for_ids, cache: false
      repository :user
    end
  end
end
