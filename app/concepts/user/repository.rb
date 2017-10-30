# frozen_string_literal: true
module User
  class Repository < ROM::Repository[:users]
    delegate :to_a, to: :users

    def one(id)
      users.where(id: id).one
    end

    def all_for_ids(ids)
      users.where(id: ids).to_a
    end
  end
end
