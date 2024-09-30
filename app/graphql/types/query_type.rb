# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :articles, [ Types::ArticleType ], null: true do
    end


    def articles
      Article.all
    end
    field :article, [ Types::ArticleType ], null: false do
      argument :id, [ ID ], required: false
    end

    def article(id: nil)
      id ? Article.where(id: id) : Article.all
    end

    field :article_by_title, [ Types::ArticleType ], null: false do
      argument :title, String, required: true
    end
    def article_by_title(title:)
      Article.where(title: title)
    end

    fields :articles_by_user_id, [ Types::ArticleType ], null: false do
      argument :user_id, Integer, required: true
    end

    def articles_by_user_id(user_id:)
      Article.where(user_id: user_id)
    end

    fields :comments_by_article_id, [ Types::CommentType ], null: false do
      argument :article_id, Integer, required: true
    end
    def comments_by_article_id(article_id:)
      Comment.where(article_id: article_id)
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
