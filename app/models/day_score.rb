class DayScore < ApplicationRecord
  validates :tension, numericality: true
  validates :tension, inclusion: { in: 1..100 }

  validates :sleep, numericality: true
  validates :sleep, inclusion: { in: 1..100 }

end
