module Authentication

extend ActiveSupport::Concern

  included do
    helper_method :logged_in?, :current_user
  end

  private
  def require_logged_user
    session[:target_url] = request.url

    redirect_to login_path,
      flash: { info: I18n.t('views.login.login_required') } unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
