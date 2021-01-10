class Goal < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :logs, through: :goal_id, source: :user
end
