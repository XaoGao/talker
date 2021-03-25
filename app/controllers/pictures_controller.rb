class PicturesController < ApplicationController
  before_action :authenticate_user!
  def create
    @picture = Picture.new picture_params
    @picture.title = params[:picture][:image].original_filename
    current_user.pictures << @picture

    if @picture.save
      redirect_to request.referer
    end
  end

  def destroy; end

  def picture_params
    params.require(:picture).permit(:image)
  end
end
