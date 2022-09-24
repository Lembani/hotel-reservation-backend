require 'swagger_helper'

RSpec.describe 'api/v1/hotels', type: :request do
  path '/api/v1/hotels' do
    get('list hotels') do
      tags 'Hotels List'
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

    post('create hotel') do
      tags 'Create Hotel'
      consumes 'application/json'
      parameter name: :hotel, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer },
          country: { type: :string },
          city: { type: :string },
          address: { type: :string },
          image_url: { type: :string }
        },
        required: %w[name description price country city address image_url category_id]
      }
      response '201', 'Hotel created' do
        let(:category) { Category.create(name: 'Konja', description: 'Amazing world', rating: 5) }
        let(:hotel) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category:, city: 'lagos', address: 'lagos', image_url: 'image.jpg')
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:hotel) { { name: 'foo' } }
        run_test!
      end
    end
  end
  path '/api/v1/hotels/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show Hotel') do
      tags 'Show Hotel'
      response(200, 'successful') do
        let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        let(:id) do
          Hotel.create(name: 'Jango', price: '1000', description: 'Best hotel', country: 'Nigeria',
                       category_id: 1, city: 'lagos', address: 'lagos', image_url: 'image.jpg').id
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

      response '200', 'Hotel not found' do
        let(:id) { '' }
        run_test!
      end
    end

    patch('update Hotel') do
      tags 'Update Hotel'
      consumes 'application/json'
      parameter name: :hotel, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer },
          country: { type: :string },
          city: { type: :string },
          address: { type: :string },
          image_url: { type: :string }
        },
        required: %w[name description price country city address image_url category_id]
      }
      response '200', 'Hotel updated' do
        let(:category) { Category.create(name: 'Konja', description: 'Amazing world', rating: 5) }
        let(:hotel) do
          Hotel.create(id: 1, name: 'Jango', price: '1000', description: 'Best hotel',
                       country: 'Nigeria', category:, city: 'lagos', address: 'lagos',
                       image_url: 'image.jpg')
        end
        let(:id) { 1 }
        run_test!
      end
    end

    put('update hotel') do
      tags 'Update Hotel'
      consumes 'application/json'
      parameter name: :hotel, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer },
          country: { type: :string },
          city: { type: :string },
          address: { type: :string },
          image_url: { type: :string }
        },
        required: %w[name description price country city address image_url category_id]
      }
      response '200', 'Hotel updated' do
        let(:category) { Category.create(name: 'Konja', description: 'Amazing world', rating: 5) }
        let(:hotel) do
          Hotel.create(id: 1, name: 'Jango', price: '1000', description: 'Best hotel',
                       country: 'Nigeria', category:, city: 'lagos',
                       address: 'lagos', image_url: 'image.jpg')
        end
        let(:id) { 1 }
        run_test!
      end
    end

    delete('delete Hotel') do
      tags 'Delete Hotel'
      consumes 'application/json'
      parameter name: :hotel, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer },
          country: { type: :string },
          city: { type: :string },
          address: { type: :string },
          image_url: { type: :string }
        },
        required: %w[name description price country city address image_url category_id]
      }
      response(200, 'successful') do
        let(:category) { Category.create(name: 'Konja', description: 'Amazing world', rating: 5) }
        let(:hotel) do
          Hotel.create(id: 1, name: 'Jango', price: '1000', description: 'Best hotel',
                       country: 'Nigeria', category:, city: 'lagos',
                       address: 'lagos', image_url: 'image.jpg')
        end
        let(:id) { 1 }
        run_test!
      end
    end
  end
end
