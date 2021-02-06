class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @game = Game.find(params[:id])
  end

  def create
    player = Player.new({
      position: params[:player][:position],
      injured: params[:player][:injured],
      weight: params[:player][:weight],
      game_id: params[:id]
      })

    player.save
    redirect_to "/games/#{player.game.id}/players"
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update({
      position: params[:player][:position],
      weight: params[:player][:weight],
      injured: params[:player][:injured]
      })

    player.save

    redirect_to "/players/#{player.id}"
  end

  def destroy
    Player.destroy(params[:id])

    redirect_to "/players/"
  end
end
