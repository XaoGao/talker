class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.filter(filter_params).paginate(page: params[:page], per_page: 15).all_except current_user
    @filter = User.new
  end

  def clear_filter
    redirect_to users_path
  end

  def show
    @user = User.with_pictures.friendly.find(params[:id])
    @subscribers = @user.subscribers.includes([pictures: { image_attachment: :blob }])
    @subscriptions = @user.subscriptions.includes([pictures: { image_attachment: :blob }])
    @articles = @user.articles.with_author.with_picture.includes([:bookmarks]).decorate
  end

  def change_status
    user = User.friendly.find(params[:id])
    if current_user == user
      user.update(status: params[:status])
      redirect_to request.referer
    end
  end

  def photos
    @user = User
            .with_pictures
            .with_pictures_for_comments
            .friendly
            .find(params[:id])
    @pictures = @user.pictures
    @picture = Picture.new
  end

  private

  def filter_params
    params.slice('first_name', 'last_name', 'username', 'date_of_birth', 'city', 'country')
  end
end
