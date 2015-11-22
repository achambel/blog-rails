class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: I18n.t('views.defaults.notice.save')
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('views.defaults.notice.update')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: I18n.t('views.defaults.notice.destroy')
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params
      .require(:user)
      .permit(:name, :whoami, :email, :password,
                                      :password_confirmation)
  end
end
