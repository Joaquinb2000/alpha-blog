class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update ]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user= User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice]= "Account info updated succesfully."
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{@user.username.capitalize}!"
      redirect_to articles_path
    else
      render "new"
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end