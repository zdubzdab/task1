class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]#devise
  load_and_authorize_resource #cancan
  before_action :set_user, only: [:show, :edit, :update, :email, :destroy]

  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 2).order("created_at DESC")
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.js
        format.html { redirect_to users_path }
      else
        format.html { render partial: "form" }
        format.js
        end
    end
  end

  def show
    @articles = @user.articles.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def email
    UserMailer.welcome_email(@user).deliver
    redirect_to users_path
  end

  def destroy
    @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url }
        format.js  { render :nothing => true }
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :id, :password, :avatar, :username)
  end
end
