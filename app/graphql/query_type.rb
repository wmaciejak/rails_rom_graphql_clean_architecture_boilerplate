# frozen_string_literal: true

QueryType = GraphQL::ObjectType.new.tap do |root|
  root.name = "Query"
  root.description = "The query root of this schema"
  root.fields = Utils::CombineFields.call(
    [
      QueryTypes::User,
      QueryTypes::Post,
      QueryTypes::Comment,
    ],
  )
end
