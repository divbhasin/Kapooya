class UsersController < ApplicationController
  before_action :signed_in_user, only: [:update, :edit, :index]
  before_action :correct_user, only: [:edit, :update]  
  before_action :admin_user, only: [:destroy]
  def new
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
    @micropost = Micropost.find(params[:id])
    # @micropost = Micropost.find(params[:id])
    # @comments = @micropost.comments.paginate(page: params[:page])
  end

  def create 
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the blog"
  		redirect_to @user
      respond_to :html, :js
  	else
  		render 'new'
  end
end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
  end
end
  def edit
end

  def destroy
  @userd = User.find(params[:id]).destroy
    flash[:success] = @userd.name + 'destroyed'
    redirect_to users_path
end

def following
  @following = current_user.following.paginate(page: params[:page], per_page: 10)

  end

  def followers
 @followers = current_user.followers.paginate(page: params[:page], per_page: 10)
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
