class ApplicationController < ActionController::Base
  def move_to_signed_in
    unless admin_signed_in?
      # redirect_to new_admin_session_path
      redirect_to '/users/sign_in'
    end
  end
end
