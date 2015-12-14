class LoginController < ApplicationController
  def new
  end

  def create
    # TODO: user.authenticate
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, notice: I18n.t('views.defaults.login_fail')
    end
  end
end
