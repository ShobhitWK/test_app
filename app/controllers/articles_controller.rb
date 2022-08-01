class ArticlesController < ApplicationController
  def show

    @article = Article.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render :error

    end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    render plain: @article.inspect
  end
end
