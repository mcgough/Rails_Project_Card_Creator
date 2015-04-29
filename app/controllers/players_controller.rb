class PlayersController < ApplicationController

  def index
    @player = Player.all
  end

  def new
    @player = Player.new
  end


  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to root_path
  end

  private

  def player_params
    params.require(:player).permit(:name,:team,:position)
  end


end