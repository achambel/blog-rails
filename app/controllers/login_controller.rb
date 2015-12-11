class LoginController < ApplicationController
  def new
  end

  def create
    # TODO: user.authenticate
    redirect_to root_path
  end
end
