require 'rails_helper'

RSpec.describe 'GET /api/v1/hotels/:id/reservations', type: :feature do
  let(:reservation) do
    Reservation.create(reason: 'I cant go, its late', duration: '2days', start_day: '2020-09-21', end_day: '2022-09-22')
  end
end
