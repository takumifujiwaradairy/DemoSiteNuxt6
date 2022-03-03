class Api::V1::StatusesController < ApplicationController
  before_action :set_article, only: [:update]

  def update
    @article.update(article_params)
    render json: @article
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def article_params
    params.permit(:status)
  end
end
