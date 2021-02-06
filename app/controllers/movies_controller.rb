class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @store = VideoStore.find(params[:id])
  end

  def create
    movie = Movie.new({
      available: params[:movie][:available],
      year_filmed: params[:movie][:year_filmed],
      name: params[:movie][:name],
      video_store_id: params[:id]
      })

    movie.save
    redirect_to "/video_stores/#{movie.video_store.id}/movies"
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update({
      name: params[:movie][:name],
      available: params[:movie][:available],
      year_filmed: params[:movie][:year_filmed]
      })

    movie.save

    redirect_to "/movies/#{movie.id}"
  end

  def destroy
    Movie.destroy(params[:id])

    redirect_to "/movies/"
  end
end
