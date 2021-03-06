class TagsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]#devise
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def new
    @tag = Tag.new
  end

  def index
     @tags = Tag.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end
 
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
 
    redirect_to tags_path
  end


  private
    def set_tag
      @tag = Tag.find(params[:id])
    end
    
    def tag_params
      params.require(:tag).permit(:name, :id, article_ids: [])
    end

end
