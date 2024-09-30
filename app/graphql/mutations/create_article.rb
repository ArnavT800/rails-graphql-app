module Mutations
  class CreateArticle < BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true

    field :article, Types::ArticleType, null: false

    def resolve(title:, content:)
      article = Article.create(title: title, content: content, user: context[:current_user])
      { article: article }
    end
  end
end
