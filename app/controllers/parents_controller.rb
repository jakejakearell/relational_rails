class ParentsController < ApplicationController
  def index
    @games = Game.all
    @video_stores = VideoStore.all
  end

  def show
    @game = Game.find(params[:id])
    @video_store = VideoStore.find(params[:id])
  end

  def new
  end

  def create
    game = Game.new({
      stadium_name: params[:game][:stadium_name],
      attendance: params[:game][:attendance],
      televised: params[:game][:televised]
      })

    game.save

    redirect_to '/parents'
  end
end
