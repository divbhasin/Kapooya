class MicropostsController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
before_filter :correct_user, only: [:destroy, :update]

def index
end

def create
@micropost = current_user.microposts.build(params[:micropost]) 
if @micropost.save
	flash[:success] = "Status Updated"
	redirect_to root_url
else
	@feed_things = []
	render 'static_pages/home'
end
end

def update
   @micropost = current_user.microposts.find_by(id: params[:id])
    if @micropost.update
       flash.now[:success] = "Post updated"
     else
      render 'update'
    end
end

def show
  @micropost = Micropost.find(params[:id])
end


def destroy
   flash[:success] = "Post deleted"
	@micropost.destroy
	redirect_to root_url
  respond_to do |format|
    format.js
  end
end

private
   def micropost_params
   	params.require(:micropost).permit(:content)
   end

   def correct_user
   	@micropost = current_user.microposts.find_by(id: params[:id])
   	redirect_to root_url if @micropost.nil?
   end
end