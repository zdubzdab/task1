class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show] #devise
  load_and_authorize_resource except: :create #cancan
  before_action :set_article, only: [:show, :edit, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 12).order("created_at DESC")

    if params[:search]
      @articles = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 12).order("created_at DESC")
    else
      @articles = Article.paginate(:page => params[:page], :per_page => 12).order("created_at DESC")
    end
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
      @user = current_user
    else
      @user = @article.user
    end
  end

  def edit
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
    @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url }
        format.js  { }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text, :id, :user_id)
    end

end
