class PersonsController < ApplicationController
  def profile
    @articles = current_user.articles.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :id, :password, :avatar, :username)
    end
  
end
