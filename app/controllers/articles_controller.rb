class ArticlesController < ApplicationController
  def show

    @article = Article.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render :error
      
    end
end
