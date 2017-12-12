# frozen_string_literal: true

module User
  module Resolvers
    class Comments < Utils::BaseResolver
      batch_load mode: :many, key: :author_id, fetch_method: :all_for_author, cache: false
      repository :comment
    end
  end
end
