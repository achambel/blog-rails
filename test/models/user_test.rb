require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "requires name" do
    user = User.create(name: nil)
    assert user.errors[:name].any?
  end

  test "name should have minimum 3 chars" do
    user = User.create(name: 'Jo')
    assert user.errors[:name].any?
  end

  test "name should have maximum 50 chars" do
    user = User.create(name: "Alice" * 11)
    assert user.errors[:name].any?
  end

  test "requires e-mail" do
    user = User.create(email: nil)
    assert user.errors[:email].any?
  end

  %w[
    invalid
    a@a
    a@a.a
    a..@example.org
    a..a@example.org
    ].each do |email|
      test "requires valid e-mail (#{email})" do
        user = User.create(email: email)
        assert user.errors[:email].any?
      end
    end

  %w[
    jonh@example.com
    jonh.doe@example.com
    jonh_doe@example.com
    jonh@sub.example.com
    jonh@example-domain.com
    jonh@example.io
    jonh@example.com.br
    jonh@example.co.uk
    jonh+spam@example.com
    JONH@EXAMPLE.COM
  ].each do |email|
      test "accepts valid e-mail (#{email})" do
        user = User.create(email: email)
        assert user.errors[:email].empty?
      end
  end

  test "permit only one e-mail" do
    data = {
              name: 'Jonh',
              email: 'jonh.doe@example.com',
              password_digest: 'jksjkjsk'
            }

    user1 = User.create(data)
    user2 = User.create(data)

    assert user2.errors[:email].any?
  end

  test "requires password confirmation" do
    user = User.create(password: 'test', password_confirmation: 'invalid')
    assert user.errors[:password_confirmation].any?
  end
end
