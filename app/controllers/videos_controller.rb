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
    @comment = Comment.new
    @comments = @video.comments.includes(:user)
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if current_user.id == @video.user_id
      @video.update(video_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if current_user.id == @video.user_id
      @video.destroy
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :overview, :genre_id, :video).merge(user_id: current_user.id)
  end


end
