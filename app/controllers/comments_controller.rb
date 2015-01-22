class CommentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource except: :create

  def create
    @article = Article.find(params[:article_id])
    @user = current_user
    @comment = @article.comments.create(comment_params)
      if @comment.save
         render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
      else
          render :js => "alert('error saving comment');"
      end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
      respond_to do |format|

        format.js  { }
      end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id, :article_id)
    end
end
