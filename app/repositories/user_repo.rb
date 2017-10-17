# frozen_string_literal: true

class UserRepo < ROM::Repository[:users]
  delegate :to_a, to: :users

  def one(id)
    users.where(id: id).one
  end
end
