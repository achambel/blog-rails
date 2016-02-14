require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  setup do
    5.times do
      User.create(name: SecureRandom.hex,
                  email: "#{SecureRandom.hex}@mail.org",
                  password: 'test',
                  password_confirmation: 'test')
    end

    users = User.order(created_at: 'DESC').take(5)
    category = categories(:category1)

    users.each do |u|
      Post.create(title: "Title #{u.email}",
                  content: "Content #{u.name}",
                  category: category,
                  user: u)
    end
  end

  test "should get top 5 authors with more posts" do
    authors = Author.top(5)
    assert_equal 5, authors.count
  end
end
