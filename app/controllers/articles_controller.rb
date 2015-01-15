class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show] #devise
  load_and_authorize_resource except: :create #cancan

  def new
    @article = Article.new
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 12).order("created_at DESC")
  end
 
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    respond_to do |format|
      if @article.save
        format.js
        #format.html { redirect_to articles_path }
      else
        format.html { render partial: "form" }
        #format.js
        end
    end
  end
 
  def show
    if user_signed_in?
      @article = Article.find(params[:id])
      @user = current_user
    else
      @article = Article.find(params[:id])
      @user = @article.user
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:article][:id])
    respond_to do |format|
      if @article.update(article_params)
        #format.html { redirect_to article_path }
        format.js
      else
        format.html { render partial: "form" }
        format.js
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url }
        format.js  { }
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :id, :user_id)
    end

end
