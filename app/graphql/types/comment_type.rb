# frozen_string_literal: true

CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :content, !types.String
  field :created_at, !types.String
  field :updated_at, !types.String
  field :author_id, !types.String
  field :post_id, !types.String
end
