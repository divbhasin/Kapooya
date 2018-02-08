class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  	@micropost = current_user.microposts.build
  	@feed_things = current_user.feed.paginate(page: params[:page], per_page: 5)
   # @microposts = Micropost.find(params[:id])
   # @comment = @microposts.comments.build(params[:user_id])
    @microposts = Micropost.find_by(:id)
    @comment = Comment.create(commenting: "Blah", micropost_id: @microposts, user_id: @user.id)
  end
end

  def help
  end

  def signup
  end

  def contact
  end
end
