class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :user

  def user
    name = object.user.name
  end
end
