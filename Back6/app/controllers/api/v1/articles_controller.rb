class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :show, :update]

  def index
    currenrt_user_likes_ids =current_user.likes.pluck(:article_id)
    articles = Article.ransack(params[:q]).result(distinct: true)
    articles = articles.map do |article|
      article.likes_count = article.likes.count
      article.is_like = article.id.in?(currenrt_user_likes_ids)
      article
    end
    render json: articles.to_json(include: [:tags], methods: [:likes_count, :is_like])
  end
  
  def create
    # Article.new({title: 'aa', body: 'bbb', tag_ids: [1,2, 3]})
    article = current_user.articles.build(article_params) 
    if article.save
      render json: article.to_json(include: [:tags], methods: [:likes_count, :is_like])
    else
      render json: article.errors, status: 422
    end
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
    else
      render json:@article.errors, status: 401
    end
  end

  def show
    render json: @article.to_json(include: [:tags])
  end

  def update
    article = @article.update(article_params)
  end
  
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # カラム名_idsとすると関連付けを行ってくれる
    params.require(:article).permit(:title, :body, tag_ids: [])
  end
end
