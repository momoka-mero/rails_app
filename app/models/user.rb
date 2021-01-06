class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :logs, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_logs, through: :likes, source: :log

  belongs_to :target, optional: true



  def already_liked?(log)
    self.likes.exists?(log_id: log.id)
  end
end
