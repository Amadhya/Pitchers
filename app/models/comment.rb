class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :post
	has_many :likes

	def user_can_like(user_id)
		if self.likes.find_by(user_id:user_id) != nil
			return false
		end

		return true

	end

	def like_status_string(user_id)
		if self.user_can_like(user_id)
			return '<i class="far fa-thumbs-up" style="font-size:18px;color:#41a7d4">Like</i>'.html_safe
		else
			return '<i class="fas fa-thumbs-up" style="font-size:18px;color:#41a7d4">Unlike</i>'.html_safe

		end

	end
end
