class ParentsController < ApplicationController
  def index
    @games = Game.all
    @video_stores = VideoStore.all
  end

  def show
    @game = Game.find(params[:id])
  end
end
