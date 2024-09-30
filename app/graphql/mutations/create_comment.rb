module Mutations
  class CreateComment < BaseMutation
    argument :article_id, Integer, required: true
    argument :body, String, required: true
    argument :user_id, Integer, required: true

    field :comment, Types::CommentType, null: false

    def resolve(article_id:, body:, user_id:)
      comment = Comment.create(article_id: article_id, body: body, user_id: user_id)
      { comment: comment }
    end
  end
end
