class PostSerializer < ActiveModel::Serializer
  attributes :id,:content,:like_count
  has_many :comments
  belongs_to :user
  def like_count
  	object.likes.count
  end
end
