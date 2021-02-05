class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
  end

  def create
    video_store = VideoStore.new({
      name: params[:video_store][:name],
      rank: params[:video_store][:rank],
      flagship_store: params[:video_store][:flagship_store]
      })

    video_store.save

    redirect_to '/parents'
  end

end
