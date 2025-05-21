class Earning < ApplicationRecord
  belongs_to :event

  CATEGORIES = ["miscellaneous", "income", "tips", "gift", "dances", "rooms", "stage tips"]

  validates :title, presence: true 
  validates :event_id, presence: true
  validates :amount, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES}
end
