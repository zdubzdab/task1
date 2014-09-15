class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def index 
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.js
        format.html 
      else
        format.html { render partial: "form" }
        format.js
        end
    end
  end

  def show
    @user = User.find(params[:id])
     respond_to do |format|
        format.html { redirect_to user_path }
        format.js
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path }
        format.js
      else
        format.html { render action: 'edit'}
      end
    end
  end


  def email
    @user = User.find(params[:id])
    UserMailer.welcome_email(@user).deliver
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url }
        format.js  { render :nothing => true }
    end
  end


private
  def user_params
    params.require(:user).permit(:name, :email, :id)
  end
end
