# frozen_string_literal: true

class Posts < ROM::Relation[:sql]
  schema(infer: true)
end
