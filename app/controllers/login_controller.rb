class LoginController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, flash: { error: I18n.t('views.login.login_fail') }
    end
  end

  def destroy
    reset_session
    redirect_to login_path, flash: { info: I18n.t('views.login.logout_alert') }
  end
end
