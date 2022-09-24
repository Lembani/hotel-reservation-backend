require 'swagger_helper'

RSpec.describe '/api/v1/hotels/{hotel_id}/reservations', type: :request do
  let(:user) { User.create!(name: 'example', email: 'example.com', password: '123456') }
  let(:category) { Category.create!(name: 'Konja', description: 'Amazing world', rating: 5) }
  let(:hotel) do
    Hotel.create!(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria', category:, city: 'lagos',
                  address: 'lagos', image_url: 'image.jpg')
  end
  let(:hotel_id) { hotel.id }
  let(:reservation) do
    Reservation.create!(user:, hotel:, reason: 'I cant go, its late', duration: '2days',
                        start_day: '2020-09-21', end_day: '2022-09-22')
  end
  let(:res_id) { reservation.id }

  it do
    path "/api/v1/hotels/#{hotel_id}/reservations" do
      get('list reservations') do
        tags 'Reservations List'
        response(200, 'successful') do
          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end

  it do
    path "/api/v1/hotels/#{hotel_id}/reservations" do
      post('create reservation') do
        tags 'Create Reservation'
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            reason: { type: :text },
            duration: { type: :string },
            start_day: { type: :datetime },
            end_day: { type: :datetime }
          },
          required: %w[reason duration start_day end_day]
        }
        response '201', 'reservation created' do
          reservation
          run_test!
        end
        response '422', 'invalid request' do
          let(:reservation) { { reason: 'I am tired' } }
          run_test!
        end
      end
    end
  end

  it do

    path "/api/v1/hotels/#{hotel_id}/reservations/#{res_id}" do
      # You'll want to customize the parameter types...
      parameter name: 'id', in: :path, type: :string, description: 'id'
      get('show Hotel') do
        tags 'Show Hotel'
        response(200, 'successful') do
          let(:reservation) { reservation.id }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
        response '200', 'Hotel not found' do
          let(:id) { '' }
          run_test!
        end
      end
    end
  end

  it do
    path "/api/v1/hotels/#{hotel_id}/reservations/#{res_id}" do
      patch('Update reservation') do
        tags 'Update Reservation'
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            reason: { type: :text },
            duration: { type: :string },
            start_day: { type: :datetime },
            end_day: { type: :datetime }
          },
          required: %w[reason duration start_day end_day]
        }
        response '200', 'reservation updated' do
          reservation
          let(:id) { reservation.id }
          run_test!
        end
      end
    end
  end

  it do
    path "/api/v1/hotels/#{hotel_id}/reservations/#{res_id}" do
      delete('delete reservation') do
        tags 'delete Reservation'
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            reason: { type: :text },
            duration: { type: :string },
            start_day: { type: :datetime },
            end_day: { type: :datetime }
          },
          required: %w[reason duration start_day end_day]
        }
        response '200', 'reservation deleted' do
          reservation
          let(:id) { reservation.id }
          run_test!
        end
      end
    end
  end
end
