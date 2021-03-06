module Api
	module V1
		class PostsController < ApplicationController
			before_action :set_api_current_user, only: [:create]
			def home
				@post=Post.all
				render json: @post

			end

			def create
				# byebug
				new_post = Post.create(post_params)
				new_post.user = @api_current_user
				new_post.save
				return render json: new_post
			end

			private

			def post_params
				params.require(:post).permit(:content, )
			end
		end
	end
end