class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :events, dependent: :destroy
  has_many :earnings, through: :events
  has_many :expenses, through: :events
end
