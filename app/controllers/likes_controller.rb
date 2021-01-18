class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(video_id: params[:video_id])
    if @like.save
      flash[:success] = "いいね登録しました"
      redirect_to "/videos/#{params[:video_id]}"
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, video_id: params[:video_id])
    if @like.destroy
      flash[:success] = "いいね解除しました"
      redirect_to "/videos/#{params[:video_id]}"
    end
  end

end
