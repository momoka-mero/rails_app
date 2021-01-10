class Target < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :logs
end
