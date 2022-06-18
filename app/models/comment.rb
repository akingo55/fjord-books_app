# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true

  def user_name
    user = User.find(user_id)
    if user.name.nil?
      user.email
    else
      user.name
    end
  end

  def format_time
    created_at.strftime('%Y/%m/%d %H:%M')
  end
end
