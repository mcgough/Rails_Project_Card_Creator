class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def show
     @tag = Tag.find(params[:id])
     player_ids= PlayersTags.where(tag_id:@tag)
     @players = []
     player_ids.each do |p|
        @players << Player.find(p.player_id)
      end
     # render :json => @players
  end


  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def destroy
    # render :json => params
    @tag = Tag.find(params[:id])
    @times = PlayersTags.where(tag_id:@tag).length
    if PlayersTags.find_by_tag_id(@tag)
      if @times > 1
        flash[:danger] = "Sorry, this tag is in use: #{@times} times"
      else
        flash[:danger] = "Sorry, this tag is in use: #{@times} time"
      end
      redirect_to tags_path
    else
      @tag.destroy
      redirect_to tags_path
    end

  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end


end