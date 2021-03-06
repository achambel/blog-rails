class ActionDispatch::IntegrationTest
  def login_as(user, visit_login_path = true)
    visit login_path if visit_login_path

    page.fill_in 'E-mail', with: user.email
    page.fill_in 'Senha', with: 'test'

    page.click_button 'Entrar'
  end
end
