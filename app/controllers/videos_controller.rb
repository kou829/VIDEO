class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @video = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.valid?
      @video.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
    @videos = Video.where.not(id: @video.id)
  end

  private

  def video_params
    params.require(:video).permit(:title, :overview, :genre_id, :video).merge(user_id: current_user.id)
  end


end
