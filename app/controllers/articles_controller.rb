class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :edit, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(articles_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was created sucessfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def update

    if @article.update(articles_params)
      flash[:notice] = "Article was updated sucessfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:alert] = "Article was deleted sucessfully."
      redirect_to articles_path
    else
      flash[:alert] = "Can't delete the article"
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
     render :error
  end

  def articles_params
    params.require(:article).permit(:title, :description)
  end

end
