class CommentsController < ApplicationController
	def create
		@micropost = Micropost.find(params[:id])
		#micropost_id = @micropost.id
		# Micropost.find(params[:micropost_id]) <- Can we do this? Micropost_id is not a column in the micropost table but we are in the comments model ri now
		@comment = Comment.new(commenting: commenting, micropost_id: @micropost.id, user_id: current_user.id)
		# current_user should be in there somewhere ^
		# @comment = Comment.where(micropost_id: @micropost.id)
		if @comment.save 
			redirect_to root_url
		else
			render current_user
		end
	end
	def show
		@micropost = Micropost.find_by(id: params[:id])
		@comment = Comment.find_by(:user_id).where(:micropost_id = @micropost.id)
	end
	private
	def comment_params
		params.require(:comment).permit(:commenting, :user_id, :micropost_id)
	end
end
