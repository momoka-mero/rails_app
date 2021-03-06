class Log < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
  belongs_to :target, optional: true
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
