# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  def format_time
    self.created_at.strftime('%Y/%m/%d %H:%M')
  end

  def user_name
    user_id = self.user_id
    User.find(user_id).name
  end
end
