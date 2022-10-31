class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update ]

  def new
    @user= User.new
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

  def edit
  end

  def update
    if user.update(user_params)
      flash[:notice]= "Changes saved succesfully."
      redirect_to @user
    else
      render "edit"
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
