class LoginController < ApplicationController
  def new
    session[:referrer] = request.referrer if request.url != request.referrer
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      target = session[:target_url] || session[:referrer]
      reset_session
      session[:user_id] = user.id
      redirect_to target || root_path
    else
      redirect_to login_path, flash: { error: I18n.t('views.login.login_fail') }
    end
  end

  def destroy
    reset_session
    redirect_to login_path, flash: { info: I18n.t('views.login.logout_alert') }
  end
end
