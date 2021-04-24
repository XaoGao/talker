class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all_except current_user
  end

  def show
    @user = User.with_pictures.find(params[:id])
    @subscribers = @user.subscribers.includes([pictures: { image_attachment: :blob }])
    @subscriptions = @user.subscriptions.includes([pictures: { image_attachment: :blob }])
    @articles = @user.articles.with_author.with_picture
  end

  def change_status
    user = User.find(params[:id])
    if current_user == user
      user.update(status: params[:status])
      redirect_to request.referer
    end
  end

  def photos
    @user = User
            .with_pictures
            .with_pictures_for_comments
            .find(params[:id])
    @pictures = @user.pictures
    @picture = Picture.new
  end
end
