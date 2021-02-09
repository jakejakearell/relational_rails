class VideoStoresController < ApplicationController
  def index
    @video_stores = VideoStore.all
  end

  def new
  end

  def show
    @video_store = VideoStore.find(params[:id])
  end

  def show_child
    video_stores = VideoStore.find(params[:id])
    @store_movies = video_stores.movies
  end

  def create
    video_store = VideoStore.new({
      name: params[:video_store][:name],
      rank: params[:video_store][:rank],
      flagship_store: params[:video_store][:flagship_store]
      })

    video_store.save

    redirect_to '/video_stores'
  end

  def edit
    @video_store = VideoStore.find(params[:id])
  end

  def update
    video_store = VideoStore.find(params[:id])
    video_store.update({
      name: params[:video_store][:name],
      rank: params[:video_store][:rank],
      flagship_store: params[:video_store][:flagship_store]
      })

    video_store.save

    redirect_to "/video_stores/#{video_store.id}"
  end

  def destroy
    VideoStore.destroy(params[:id])

    redirect_to "/video_stores/"
  end
end
