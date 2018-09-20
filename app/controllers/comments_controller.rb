class CommentsController < ApplicationController
	def new
		@micropost = Micropost.find(params[:micropost_id])
		@user = @micropost.user
		@comment = Comment.new
		#micropost_id = @micropost.id
		# Micropost.find(params[:micropost_id]) <- Can we do this? Micropost_id is not a column in the micropost table but we are in the comments model ri now
		# current_user should be in there somewhere ^
		# @comment = Comment.where(micropost_id: @micropost.id)
	end
	
	def create
		@micropost = Micropost.find(params[:micropost_id])
		@user = @micropost.user
       @comment = current_user.comments.create(params[:comment])
       @comment.user_id = current_user.id
       @comment.micropost_id = @micropost.id
       @comment.commenting = params[:commenting]
       # @comment = @user.comments.build(commenting: params[:commenting], micropost_id: @micropost , user_id: current_user.id)
       if @comment.save
            flash[:success] = "Comment saved" 
			redirect_to root_url
		else
			render 'new'
		end
	end
	
	def show
		@micropost = Micropost.find_by(params[:micropost_id])
		# @comment = Comment.find_by(:user_id).where(:micropost_id = @micropost.id)
		@comment = @micropost.comments.find(params[:user_id])
	end
	
	def index
		@micropost = Micropost.find(params[:micropost_id])
		 @user = @micropost.user
		 @comment = @micropost.comments.find_by(params[:micropost_id])
	end

	private
	def comments_params
		params.require(:comment).permit(:commenting, :user_id, :micropost_id)
	end
end
