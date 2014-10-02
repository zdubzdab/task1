class TagsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @tag = Tag.new
    @tag.user = current_user
  end

  def index
    @tags = Tag.all
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
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.user != current_user
        format.html { redirect_to @tag, notice: 'That tag is not yours to edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      elsif @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])

    if @tag.user != current_user
      flash[:notice] = 'That tag is not yours to destory'

      respond_to do |format|
        format.html { redirect_to :back }
        format.json { head :no_content }
      end
    else
      @tag.destroy

      respond_to do |format| 
        format.html { redirect_to tags_url }
        format.json { head :no_content }
      end 
    end
 end

private
  def tag_params
    params.require(:tag).permit(:name, :id, article_ids: [], user_ids: [])
  end

end
