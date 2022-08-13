# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  def format_time
    I18n.l created_at, format: :long
  end

  def user_name
    user_id = self.user_id
    User.find(user_id).name
  end
end
