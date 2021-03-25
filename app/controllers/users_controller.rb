class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all_except current_user
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.includes([:author]).includes([picture: { image_attachment: :blob }])
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
            .includes([pictures: { image_attachment: :blob }])
            .find(params[:id])
    @pictures = @user.pictures
    @picture = Picture.new
  end
end
