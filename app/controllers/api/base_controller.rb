class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  def token_authenticate_user!
    
  end
end
