class GamesController < ApplicationController
  def index
    @games = Game.order_by_created_date
  end

  def new
  end

  def show
    @game = Game.find(params[:id])
    @game_players = Game.number_of_players
  end

  def show_child
    @game = Game.find(params[:id])
    @game_players = Player.injured?(@game)
  end

  def new_page
    @game = Game.find(params[:id])
    @player_weight = Player.weight?(params)
    render :show_child
  end

  def order
    @game = Game.find(params[:id])
    @player_weight = Player.alphabetize(params)
    render :show_child
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
