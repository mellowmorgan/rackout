class Expense < ApplicationRecord
  belongs_to :event

  CATEGORIES = ["miscellaneous", "club fees", "stage fee", "nails", "hair", "beauty", "massage", "upkeep", "education", "waxing", "cosmetics", "clothing", "surgical procedures", "skincare", "appliances", "healthcare", "transportation", "food", "travel", "hotel"]

  validates :title, presence: true 
  validates :event_id, presence: true
  validates :amount, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  after_save :update_event

  private
    def update_event
      event = self.event
      if (event.is_work && event.earnings.any?) || !event.is_work
        event.update!(dismiss: true)
      end
    end 
end
