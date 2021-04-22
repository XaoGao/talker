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
    clear_main_photo @picture

    if @picture.update(is_main: true)
      flash[:notice] = 'Главная фотография обновлена'
    else
      flash[:alert] = 'Ошибка при обновлении фотографии'
    end
    redirect_to request.referer
  end

  def destroy; end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end

  def clear_main_photo(picture)
    main_picture = picture.imageable.pictures.find_by(is_main: true)
    main_picture.update(is_main: false) if main_picture.present?
  end
end
