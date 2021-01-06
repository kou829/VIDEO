class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/videos/#{comment.video.id}"
  end

  private 

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, video_id: params[:video_id])
  end

end
