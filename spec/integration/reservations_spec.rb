require 'swagger_helper'

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

# spec/integration/pets_spec.rb
# require 'swagger_helper'

# describe 'Categories API' do
#       let(:category) { Category.create!(name: 'Konja', description: 'Amazing world', rating: 5) }

#     let(:hotel) do
#             Hotel.create!(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria', category:, city: 'lagos',
#                          address: 'lagos', image_url: 'image.jpg')
#     end
#   let(:hotel_id) { hotel.id }


#   it do
#   path "/api/v1/hotels/#{hotel_id}/reservations" do
#     post 'Creates a reservation' do
#       tags 'Res'
#       consumes 'application/json'
#       parameter name: :reservation, in: :body, schema: {
#         type: :object,
#         properties: {
#           reason: { type: :text },
#           duration: { type: :string },
#           start_day: { type: :datetime },
#           end_day: { type: :datetime }
#         },
#         required: %w[reason duration start_day end_day]
#       }

#       response '201', 'reservation created' do
#         let(:reservation) { { reason: 'I cant go home, its late', duration: '2days', start_day: '2020-09-21', end_day: '2022-09-22'} }
#         run_test!
#     end

# end
# end
# end
# end


#     #   response '422', 'invalid request' do
#     #     let(:reservation) { { reason: 'Flex' } }
#     #     run_test!
#     #   end
#     end
#   end

#   path '/api/v1/categories/{id}' do
#     get 'Retrieves a category' do
#       tags 'Cats'
#       produces 'application/json'
#       parameter name: :id, in: :path, type: :string

#       response '200', 'name found' do
#         schema type: :object,
#                properties: {
#                  id: { type: :integer },
#                  name: { type: :string },
#                  description: { type: :string },
#                  rating: { type: :integer }
#                },
#                required: %w[id name description]

#         let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
#         run_test!
#       end

#       response '200', 'category not found' do
#         let(:id) { '' }
#         run_test!
#       end
#     end
#   end
# end
