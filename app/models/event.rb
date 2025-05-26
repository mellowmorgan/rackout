class Event < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy
  has_many :earnings, dependent: :destroy
  validates :title, presence: true
  validates :start_time, presence: true
  validates :is_work, presence: true
  validates :user, presence: true
end