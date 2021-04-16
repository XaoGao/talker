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

  def main
    @picture = Picture.find(params[:id])
    main_picture = @picture.imageable.pictures.find_by(is_main: true)
    main_picture.update(is_main: false) if main_picture.present?

    if @picture.update(is_main: true)
      redirect_to request.referer, notice: 'Главная фогтография обновлена'
    else
      redirect_to request.referer, alert: 'Ошибка при обновлении фотографии'
    end
  end

  def destroy; end

  def picture_params
    params.require(:picture).permit(:image)
  end
end
