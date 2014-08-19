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
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.js  
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
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
    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :id)
  end
end
