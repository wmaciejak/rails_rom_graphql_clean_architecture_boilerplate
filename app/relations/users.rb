# frozen_string_literal: true

class Users < ROM::Relation[:sql]
  schema(infer: true)
end
