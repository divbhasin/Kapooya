class UsersController < ApplicationController
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
  def signed_in_user
    redirect_to signin_path, notice: "Please sign in" unless signed_in?
  end
  end
  end 
