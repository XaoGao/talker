class HomeController < ApplicationController
  before_action :redirect_user_signed_in
  def welcome; end

  private

  def redirect_user_signed_in
    redirect_to :articles if user_signed_in?
  end
end
