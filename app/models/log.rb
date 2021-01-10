class Log < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :target
  belongs_to :goal, optional: true
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
