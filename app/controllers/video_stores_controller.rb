class VideoStoresController < ApplicationController
  def index
    @video_stores = VideoStore.all
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

    redirect_to '/video_stores'
  end
end
