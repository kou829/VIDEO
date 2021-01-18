class LikesController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    @like = Like.create(user_id: current_user.id, video_id: @video.id)
  end

  def destroy
    @video = Video.find(params[:video_id])
    @like = current_user.likes.find_by(video_id: @video.id)
    @like.destroy
  end

end
