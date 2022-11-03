class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  before_action :only_when_logged_out, only: [ :create, :new ]
  before_action :require_user, only: [ :update, :edit, :destroy ]
  before_action :require_same_user, only: [ :update, :edit, :destroy ]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user= User.new
  end

  def edit
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{@user.username.capitalize}!"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render "new"
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice]= "Account info updated succesfully."
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account and all associated articles succesfully deleted"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own user"
      redirect_to @user
    end
  end

  def only_when_logged_out
    if logged_in?
      flash[:alert]= "You must logout first to perform that action"
      redirect_to current_user
    end
  end
end
