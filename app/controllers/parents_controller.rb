class ParentsController < ApplicationController
  def index
    @games = Game.all
    @video_stores = VideoStore.all
  end
end
