# frozen_string_literal: true

module Post
  class Relation < ROM::Relation[:sql]
    schema(:posts, infer: true)
  end
end
