require 'test_helper'

class MenuTest < ActionDispatch::IntegrationTest

  test "should display just public menu itens" do
    page.visit root_path

    assert page.find('a.item', text: /^Blog Rails$/)
    assert_raise(Capybara::ElementNotFound) {page.find('a.item', text: /^Categorias$/)}
    assert_raise(Capybara::ElementNotFound) {page.find('a.item', text: /^Usuários$/)}
    assert_equal root_path, current_path
  end

  test "should display just private menu itens" do
    user = users(:alice)
    login_as(user)

    assert page.find('a.item', text: /^Blog Rails$/)
    assert page.find('a.item', text: /^Categorias$/)
    assert page.find('a.item', text: /^Usuários$/)
  end

end
