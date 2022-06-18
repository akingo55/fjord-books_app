# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true

  def user_name
    user_id = self.user_id
    User.find(user_id).name
  end

  def format_time
    created_at.strftime('%Y/%m/%d %H:%M')
  end
end
