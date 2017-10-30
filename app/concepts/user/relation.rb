# frozen_string_literal: true

module User
  class Relation < ROM::Relation[:sql]
    schema(:users, infer: true)
  end
end
