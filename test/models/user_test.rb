# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'alice follows bob' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)

    alice.follow(bob)

    assert alice.following?(bob)
    assert bob.followed_by?(alice)

    alice.unfollow(bob)

    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
  end

  test 'user name or email' do
    user = User.new(name: '', email: 'foo@example.com')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'foo'
    assert_equal 'foo', user.name_or_email
  end
end
