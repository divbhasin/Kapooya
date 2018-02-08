class UsersController < ApplicationController
<<<<<<< HEAD
  def new
  end
end
=======
  before_action :correct_user, only: [:edit, :update]
  before_filter :signed_in_user, only: [:edit, :update]
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create 
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome to the blog"
  		redirect_to @user
  	else
  		render 'new'
  end
  def update
  end
end

def private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in" unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user(@user) 
  end
  end
  end 
>>>>>>> origin/master
