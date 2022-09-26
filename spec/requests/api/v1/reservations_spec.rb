require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/hotels/{hotel_id}/reservations' do
    # You'll want to customize the parameter types...
    parameter name: 'hotel_id', in: :path, type: :integer, description: 'hotel_id'
    get('list reservations') do
      response(200, 'successful') do
        let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }

        let(:hotel_id) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category_id: id, city: 'lagos', address: 'lagos', image_url: 'image.jpg').id
        end
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

    post('create reservation') do
      tags 'Create Hotel'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reason: { type: :text },
          duration: { type: :string },
          start_day: { type: :datetime },
          end_day: { type: :datetime },
          user_id: { type: :integer },
          hotel_id: { type: :integer }
        },
        required: %w[reason duration start_day end_day user_id hotel_id]
      }
      response(201, 'successful') do
        let(:user_id) do
          User.create!(name: 'example', email: 'example@gmail.com', password: '123456',
                       password_confirmation: '123456').id
        end
        let(:category_id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        let(:hotel) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category_id:, city: 'lagos', address: 'lagos', image_url: 'image.jpg')
        end
        let(:hotel_id) { hotel.id }
        let(:reservation) do
          Reservation.create!(reason: 'I am tired', duration: '2 days', start_day: '2020-10-10', end_day: '2022-10-10',
                              user_id:, hotel_id:)
        end
        run_test!
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  path '/api/v1/hotels/{hotel_id}/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'hotel_id', in: :path, type: :string, description: 'hotel_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      response(200, 'successful') do
        let(:user_id) do
          User.create!(name: 'example', email: 'example@gmail.com', password: '123456',
                       password_confirmation: '123456').id
        end
        let(:category_id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        let(:hotel) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category_id:, city: 'lagos', address: 'lagos', image_url: 'image.jpg')
        end

        let(:hotel_id) { hotel.id }
        let(:reservation) do
          Reservation.create!(reason: 'I am tired', duration: '2 days', start_day: '2020-10-10', end_day: '2022-10-10',
                              user_id:, hotel_id:)
        end

        let(:id) { reservation.id }

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

    patch('update reservation') do
      tags 'Update Hotel'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reason: { type: :text },
          duration: { type: :string },
          start_day: { type: :datetime },
          end_day: { type: :datetime },
          user_id: { type: :integer },
          hotel_id: { type: :integer }
        },
        required: %w[reason duration start_day end_day user_id hotel_id]
      }
      response(200, 'successful') do
        let(:user_id) do
          User.create!(name: 'example', email: 'example@gmail.com', password: '123456',
                       password_confirmation: '123456').id
        end
        let(:category_id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        let(:hotel) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category_id:, city: 'lagos', address: 'lagos', image_url: 'image.jpg')
        end
        let(:hotel_id) { hotel.id }
        let(:reservation) do
          Reservation.create!(reason: 'I am tired', duration: '2 days', start_day: '2020-10-10', end_day: '2022-10-10',
                              user_id:, hotel_id:)
        end
        let(:id) { reservation.id }

        run_test!
      end
    end

    put('update reservation') do
      tags 'Update Hotel'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reason: { type: :text },
          duration: { type: :string },
          start_day: { type: :datetime },
          end_day: { type: :datetime },
          user_id: { type: :integer },
          hotel_id: { type: :integer }
        },
        required: %w[reason duration start_day end_day user_id hotel_id]
      }
      response(200, 'successful') do
        let(:user_id) do
          User.create!(name: 'example', email: 'example@gmail.com', password: '123456',
                       password_confirmation: '123456').id
        end
        let(:category_id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        let(:hotel) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category_id:, city: 'lagos', address: 'lagos', image_url: 'image.jpg')
        end
        let(:hotel_id) { hotel.id }
        let(:reservation) do
          Reservation.create!(reason: 'I am tired', duration: '2 days', start_day: '2020-10-10', end_day: '2022-10-10',
                              user_id:, hotel_id:)
        end
        let(:id) { reservation.id }

        run_test!
      end
    end

    delete('update reservation') do
      tags 'Update Hotel'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reason: { type: :text },
          duration: { type: :string },
          start_day: { type: :datetime },
          end_day: { type: :datetime },
          user_id: { type: :integer },
          hotel_id: { type: :integer }
        },
        required: %w[reason duration start_day end_day user_id hotel_id]
      }
      response(200, 'successful') do
        let(:user_id) do
          User.create!(name: 'example', email: 'example@gmail.com', password: '123456',
                       password_confirmation: '123456').id
        end
        let(:category_id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        let(:hotel) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category_id:, city: 'lagos', address: 'lagos', image_url: 'image.jpg')
        end
        let(:hotel_id) { hotel.id }
        let(:reservation) do
          Reservation.create!(reason: 'I am tired', duration: '2 days', start_day: '2020-10-10', end_day: '2022-10-10',
                              user_id:, hotel_id:)
        end
        let(:id) { reservation.id }

        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
