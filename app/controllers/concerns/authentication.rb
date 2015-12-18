module Authentication

extend ActiveSupport::Concern

  included do
    helper_method :logged_in?, :current_user
  end

  private
  def require_logged_user
    redirect_to login_path,
      alert: I18n.t('views.defaults.login_required') unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
