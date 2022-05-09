# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_friendships, class_name: 'Friendship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :user
  has_many :passive_friendships, class_name: 'Friendship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :user
  has_many :followings, through: :active_friendships, source: :following
  has_many :followers, through: :passive_friendships, source: :followed

  def follow(other_user)
    active_friendships.find_or_create_by(following_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    friendship = active_friendships.find_by(following_id: other_user.id)
    friendship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
