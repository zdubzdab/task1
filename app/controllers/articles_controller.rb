class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show], :message => "Unable to read this article."
  load_and_authorize_resource except: :create

  def new
    @article = Article.new
    @article.user = current_user
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end
 
  def create
    @article = Article.new(article_params)
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
    @article = Article.find(params[:id])
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
        format.html { render partial: "form"}
        #format.js
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.user != current_user 
      respond_to do |format| 
        format.html { redirect_to :back } 
        format.js { render js: "alert('This article is not yours to destory it');" } 
        format.json { head :no_content } 
      end 
      
    else @article.destroy  
      respond_to do |format| 
        format.html { redirect_to articles_url }
        format.js  { } 
        format.json { head :no_content } 
      end 
    end 
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :id, :user_id)
    end

end
