# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@email.com', name: '')
    assert_equal 'foo@email.com', user.name_or_email

    user.name = 'Foo'
    assert_equal 'Foo', user.name_or_email
  end

  test '#follow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    assert_not me.following?(she)
    me.follow(she)

    assert me.following?(she)
    assert she.followed_by?(me)
  end

  test '#unfollow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me.follow(she)
    assert me.following?(she)

    me.unfollow(she)
    assert_not me.following?(she)
  end
end
