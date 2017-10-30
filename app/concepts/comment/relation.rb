# frozen_string_literal: true

module Comment
  class Relation < ROM::Relation[:sql]
    schema(:comments, infer: true)
  end
end
