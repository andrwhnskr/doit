class List < ActiveRecord::Base
  validates :title, length: {minimum: 5}, presence: true
  validates :description, presence: true
end
