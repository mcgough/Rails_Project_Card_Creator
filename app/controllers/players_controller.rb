class PlayersController < ApplicationController

  def index
    @player = Player.all
  end

  def new
    @player = Player.new
    @tags = Tag.all
  end


  def create

    # render :json => params
    @player = Player.create(player_params)
    tags = params[:player][:tags]
    tags.each do |tag_id|
      @player.tags << Tag.find_by_id(tag_id) unless tag_id.blank?
    end
    if @player.save
      redirect_to players_path
    else
      render 'new'
    end
  end

  def show
    FlickRaw.api_key = 'c99b362a3347f633cf04fb177571c38b'
    FlickRaw.shared_secret = '5ccc00b6ce365997'
    @player = Player.find(params[:id])
    @tags = @player.tags
    @photos= flickr.photos.search(:text => "#{@player["name"]}",:per_page => 1,:tagged =>  "#{@player["team"]}", :sort => "relevance")
    # render :json => @photos
  end

  def edit
    @player = Player.find(params[:id])
    @tags = Tag.all
  end

  def update
    # render :json => params
    @player = Player.find(params[:id])
    @player.tags.clear
    tags = params[:player][:tag_ids]
    tags.each do |tag_id|
      @player.tags << Tag.find(tag_id) unless tag_id.blank?
    end

    if @player.update(player_params)
      redirect_to players_path
    else
      render 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:name,:team,:position)
  end


end