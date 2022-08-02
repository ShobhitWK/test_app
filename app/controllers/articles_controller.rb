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

    rescue ActiveRecord::RecordNotFound => e
      render :error
  end

  def create
    @article = Article.new(articles_params)
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
    @article.destroy
    redirect_to articles_path
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
