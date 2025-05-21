class Expense < ApplicationRecord
  belongs_to :event

  CATEGORIES = ["miscellaneous", "club fees", "stage fee", "nails", "hair", "beauty", "massage", "upkeep", "education", "waxing", "cosmetics", "clothing", "surgical procedures", "skincare", "appliances", "healthcare", "transportation", "food", "travel", "hotel"]

  validates :title, presence: true 
  validates :event_id, presence: true
  validates :amount, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
