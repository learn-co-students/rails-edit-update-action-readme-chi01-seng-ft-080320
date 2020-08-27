class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    find_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = find_article
  end

  def update
    @article = find_article
    @article.update(article_params)
    
    redirect_to article_path(@article) # article_path(@article) = articles/:id
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
