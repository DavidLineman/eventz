class ApplicationController < ActionController::Base

  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  def require_sign_in
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  def require_admin
    unless current_user_admin?
      redirect_to events_url, alert: "Unauthorized access!"
    end
  end

  

  helper_method :current_user_admin?

  helper_method :current_user

  helper_method :current_user?

end
