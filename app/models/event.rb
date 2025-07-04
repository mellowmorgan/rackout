class Event < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy
  has_many :earnings, dependent: :destroy
  validates :title, presence: true
  validates :start_time, presence: true
  validates :user, presence: true
  scope :needs_updating, -> {where("dismiss IS NOT TRUE AND ( end_time IS NULL AND start_time < ? OR (end_time < ?))", DateTime.now, DateTime.now)}

  def needs_updating?
    
      ((self.earnings.none? || self.expenses.none?) && self.is_work && dismiss==false && self.passed?) ||
      (self.earnings.none? && self.expenses.none? && !self.is_work && dismiss==false && self.passed?)
  end

  def passed?
    end_time && end_time < DateTime.now || end_time.nil? && start_time < DateTime.now
  end
end