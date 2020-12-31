class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @video = Video.new
  end

end
