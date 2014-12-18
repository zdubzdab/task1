lass ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource except: :create

  def new
    @article = Article.new
    @article.user = current_user
  end

  def index 
    @articles = Article.paginate(:page => params[:page], :per_page => 16).order("created_at DESC")
  end
 
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.js
        #format.html { redirect_to articles_path }
      else
        format.html { render partial: "form" }
<<<<<<< HEAD
        format.js
      end
=======
        #format.js
        end
>>>>>>> main
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
        format.js {}
      else
<<<<<<< HEAD
        format.html { render partial: "form"}
        format.js
=======
        format.html { render partial: "editform"}
        #format.js
>>>>>>> main
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
      @article.destroy  
        respond_to do |format| 
          format.html { redirect_to articles_url }
          format.js  { } 
          format.json { head :no_content } 
      end 
  end


private
  def article_params
    params.require(:article).permit(:title, :text, :id, :user_id)
  end

end
