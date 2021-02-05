class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    game = Game.new({
      stadium_name: params[:game][:stadium_name],
      attendance: params[:game][:attendance],
      televised: params[:game][:televised]
      })

    game.save

    redirect_to '/games'
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    game.update({
      stadium_name: params[:game][:stadium_name],
      attendance: params[:game][:attendance],
      televised: params[:game][:televised]
      })

    game.save

    redirect_to "/games/#{game.id}"
  end

  def destroy
    Game.destroy(params[:id])

    redirect_to "/games/"
  end

end
