class ActionController::TestCase
  def login_as(user)
    @request.session[:user_id] = user ? user.id : nil
  end

  def logout
    @request.session[:user_id] = nil
  end

end
