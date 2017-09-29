class Reminder < ApplicationRecord
  validates :remind_at, presence: true
end
