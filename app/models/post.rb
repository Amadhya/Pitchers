class Post < ApplicationRecord
	has_attached_file :image, styles: { large: "300x300>",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy


	# returns true if a user can like this post
	def user_can_like(user_id)
		if self.likes.where(user_id: user_id).length > 0
			return false
		end

		return true

	end


	def like_status_string(user_id)
		if self.user_can_like(user_id)
			return '<i class="far fa-thumbs-up" style="font-size:22px;color:#41a7d4">Like</i>'.html_safe
		else
			return '<i class="fas fa-thumbs-up" style="font-size:22px;color:#41a7d4">Unlike</i>'.html_safe

		end

	end

	def length()
		return self.likes.length
	end

end
