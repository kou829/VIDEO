class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(video_id: params[:video_id])
    if @like.save
      redirect_to "/videos/#{params[:video_id]}"
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, video_id: params[:video_id])
    if @like.destroy
      redirect_to "/videos/#{params[:video_id]}"
    end
  end

end
