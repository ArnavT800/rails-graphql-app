# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"

    field :create_article, mutation: Mutations::CreateArticle
    field :create_comment, mutation: Mutations::CreateComment
    def test_field
      "Hello World"
    end
  end
end
