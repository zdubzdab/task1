class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @article = Article.new
    @article.user = current_user
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
      if @article.user != current_user 
        format.html { redirect_to @article, notice: 'That article is not yours to edit' } 
        format.json { render json: @article.errors, status: :unprocessable_entity }

      elsif @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.js
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.user != current_user 
      flash[:notice] = 'That article is not yours to destory'  
      respond_to do |format| 
        format.html { redirect_to :back } 
        format.js { render :nothing => true } 
        format.json { head :no_content } 
      end 
    else @article.destroy  
      respond_to do |format| 
        format.html { redirect_to articles_url }
        format.js  { render :nothing => true } 
        format.json { head :no_content } 
      end 
    end 
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end

end
