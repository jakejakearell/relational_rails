class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
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
end
