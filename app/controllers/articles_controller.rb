class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def show
  end


  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article= Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice]= "Successfuly created article."
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice]= "Successfuly edited article."
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Succesfully deleted article"
      redirect_to articles_path
    else
      flash[:notice] = "Ooops... couldn't delete the article"
      render "/articles/#{params[:id]}"
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your articles"
      redirect_to @article
    end
  end
end
