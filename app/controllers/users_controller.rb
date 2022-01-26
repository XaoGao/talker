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
    @user = User.friendly.find(params[:id])
    @subscribers = @user.subscribers
    @subscriptions = @user.subscriptions
    @articles = @user.articles.includes(:author, :bookmarks, picture: { image_attachment: :blob }).decorate
  end

  def change_status
    user = User.friendly.find(params[:id])
    if current_user == user
      user.update(status: params[:status])
      render :show
    end
  end

  def photos
    @user = User.friendly.find(params[:id])
    @pictures = @user.pictures
    @picture = Picture.new
  end

  private

  def filter_params
    params.slice('first_name', 'last_name', 'username', 'date_of_birth', 'city', 'country')
  end
end
