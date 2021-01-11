class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @video = Video.all.order(id: 'DESC')
  end

  def new
    @videos = Video.where(id: current_user.video_ids)
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

  def genre
    @video = Video.find_by(genre_id: params[:id])
    @videos = Video.where(genre_id: params[:id]).order('created_at DESC')
  end

  # ゲストログイン機能

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "guest"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def video_params
    params.require(:video).permit(:title, :overview, :genre_id, :video).merge(user_id: current_user.id)
  end


end
