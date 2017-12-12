# frozen_string_literal: true

module User
  module Resolvers
    class Posts < Utils::BaseResolver
      batch_load mode: :many, key: :user_id, fetch_method: :all_for_user, cache: false
      repository :post
    end
  end
end
