class ActionDispatch::IntegrationTest
  def login_as(user)
    visit root_path
    click_link 'Entrar'

    page.fill_in 'E-mail', with: user.email
    page.fill_in 'Senha', with: 'test'

    page.click_button 'Entrar'
  end
end
