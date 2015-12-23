class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_user

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: I18n.t('views.defaults.notice.save')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('views.defaults.notice.update')
    else
      render :edit
    end
  end

  def destroy
    if @user.id != current_user.id
      @user.destroy
      redirect_to users_path, notice: I18n.t('views.defaults.notice.destroy')
    else
      redirect_to :back, notice: I18n.t('views.defaults.notice.not_destroy_yourself')
    end
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
