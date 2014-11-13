class List < ActiveRecord::Base
  validates :title, length: {minimum: 5}, presence: true
  validates :description, presence: true

  scope :done, -> { where(completed: true) }
  scope :not_done, -> { where(completed: false) }
  
  belongs_to :user

  def days_left
    seconds_remaining = (self.created_at.to_i + 7.days.to_i) - Time.now.to_i

    Time.at(seconds_remaining).day
  end
end
