class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :hotel, class_name: 'Hotel', foreign_key: 'hotel_id'

  validates :reason, presence: true
  validates :duration, presence: true
  validates :start_day, presence: true
  validates :end_day, presence: true
end
