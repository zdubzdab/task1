class RaitingsController < ApplicationController
    before_filter :authenticate_user!#devise
    load_and_authorize_resource except: :create#cancan
    before_action :set_article_raiting, only: [:create]

  def create
    @user = current_user
    @raiting = @article.raitings.create(raiting_params)
    respond_to do |format|
      if @raiting.save
        format.js
        format.html { redirect_to article_path(@article) }
      else
        render :js => "alert('error saving raiting');"
      end
    end
  end

  private
    def set_article_raiting
      @article = Article.find(params[:article_id])
    end

    def raiting_params
      params.require(:raiting).permit(:value, :user_id, :article_id)
    end
end
