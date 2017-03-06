class ArticlesController < ApplicationController

  def index
    @category= Category.find_by(id: params[:category_id])
    @articles = Article.where(category_id: params[:category_id])
  end

  def new
    @category= Category.find_by(id: params[:category_id])
    @article = @category.articles.new
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @article = @category.articles.new(new_category_article_params)

    if @article.save
      redirect_to category_articles_path(@category, @articles)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find_by(id: params[:category_id])
    @article = Article.find_by(id: params[:id])
  end

  def edit
    @category = Category.find_by(id: params[:category_id])
    @article = Article.find(params[:id])
  end

  def update
    @category = Category.find_by(id: params[:category_id])
    @article = Article.find(params[:id])
    if @article.update(new_category_article_params)
      redirect_to category_articles_path(@category.id)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find_by(id: params[:category_id])
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to category_articles_path(@category.id)
  end
  private
    def new_category_article_params
      params.require(:article).permit(:title, :body)
    end
end
