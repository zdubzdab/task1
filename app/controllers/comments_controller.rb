class CommentsController < ApplicationController
  before_filter :authenticate_user!#devise
  load_and_authorize_resource except: :create#cancan
  before_action :set_article_comment, only: [:create, :destroy]

  def create
    @user = current_user
    @comment = @article.comments.create(comment_params)
      if @comment.save
         render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
      else
          render :js => "alert('error saving comment');"
      end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
      respond_to do |format|
        format.html { redirect_to articles_url }
        format.js  { }
      end
  end

  private
    def set_article_comment
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id, :article_id)
    end
end
