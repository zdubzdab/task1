class PersonsController < ApplicationController
  def profile
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :id, :password, :avatar, :username)
    end
  
end
