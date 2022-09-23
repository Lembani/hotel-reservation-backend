require 'rails_helper'

RSpec.describe 'GET /api/v1/hotels', type: :feature do
  
  let(:hotel) do
    Hotel.create(name: 'Villarosa', price: '1000', description: 'Best hotel', country: 'Kenya', category: 'Five star', city: 'Nairobi',
                 address: 'Nairobi', image_url: 'image.jpg')
  end

  let(:hotel_id) { hotel.id }

  context 'Show all Hotels' do
    it 'returns HTTP ststus ok' do
      visit "/api/v1/hotels"
      assert :success
    end
  end

  context 'Show individual hotel' do
    it 'returns HTTP status ok' do
      visit "/api/v1/hotels/#{hotel_id}"
      assert :success
    end
  end
end
