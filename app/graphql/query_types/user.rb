# frozen_string_literal: true

module QueryTypes
  User = GraphQL::ObjectType.define do
    field :user do
      type UserType
      argument :id, !types.ID
      description "Find a User by ID"
      resolve ->(_obj, args, _ctx) { Container.instance["repositories.user"].one(args["id"]) }
    end

    field :users do
      type !types[UserType]
      resolve ->(_obj, _args, _ctx) { Container.instance["repositories.user"].to_a }
    end
  end
end
