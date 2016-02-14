require 'test_helper'

class SideBarTest < ActionDispatch::IntegrationTest
  test "should show top 5 authors" do
    visit root_path

    assert page.find('#top5authors > .header', text: /^Top 5 Autores$/)
    assert page.assert_selector('#top5authors > .menu > .item', maximum: 5)
  end

  test "should show top 5 categories" do
    visit root_path

    assert page.find('#top5categories > .header', text: /^Top 5 Categorias$/)
    assert page.assert_selector('#top5categories > .menu > .column', maximum: 5)
  end
end
