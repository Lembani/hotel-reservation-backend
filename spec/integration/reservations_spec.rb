require 'rails_helper'

RSpec.describe 'GET /api/v1/hotels/:id/reservations', type: :feature do
  let(:reservation) do
    Reservation.create(reason: 'I cant go, its late', duration: '2days', start_day: '2020-09-21', end_day: '2022-09-22')
  end
  let(:category) { Category.create(name: 'Konja', description: 'Amazing world', rating: 5) }
  let(:hotel) do
    Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria', category:, city: 'lagos',
                 address: 'lagos', image_url: 'image.jpg')
  end

  let(:hotel_id) { hotel.id }
  let(:id) { reservation.id }

  context 'Show all reservations' do
    it 'returns HTTP ststus ok' do
      visit "/api/v1/hotels/#{hotel_id}/reservations"
      assert :success
    end
  end

  context 'Show individual reservation' do
    it 'returns HTTP ststus ok' do
      visit "/api/v1/hotels/#{hotel_id}/reservations/#{id}"
      assert :success
    end
  end
end
