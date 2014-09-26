 class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except => [:show, :index]
  def new
    @article = Article.new
  end
  def index 
    @articles = Article.all 
  end
 
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.js
        format.html { redirect_to articles_path }
      else
        format.html { render partial: "form" }
        format.js
        end
    end
  end
 
  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path }
        format.js
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end

end
