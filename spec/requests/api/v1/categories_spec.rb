require 'swagger_helper'

RSpec.describe 'All categories API enpoints', type: :request do
  path '/api/v1/categories/{category_id}/hotels' do
    parameter name: 'category_id', in: :path, type: :integer,
              description: 'The id of the category whose hotels you want to access.'

    get('list all hotels under a category') do
      tags 'Categories'
      response(200, 'successful') do
        let(:category_id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        run_test!
      end
    end
  end

  path '/api/v1/categories' do
    get('list all categories') do
      tags 'Categories'
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

    post 'Creates a category' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          rating: { type: :integer, default: :null, comment: 'When added, ranges strictly from 1 to 5 inclusive.' }
        },
        required: %w[name description]
      }

      response '201', 'category created' do
        let(:category) { { name: 'Platinum', description: 'Top rated hotels' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:category) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/categories/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'The id of the specific category you want to access.'

    get('show category details') do
      tags 'Categories'
      response(200, 'successful') do
        let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '200', 'category not found' do
        let(:id) { '' }
        run_test!
      end
    end

    patch('update category') do
      let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
      tags 'Categories'
      consumes 'application/json'
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          rating: { type: :integer, default: :null, comment: 'When added, ranges strictly from 1 to 5 inclusive.' }
        },
        required: %w[name description]
      }

      response '200', 'category updated' do
        let(:category) { { name: 'Platinum', description: 'Top rated hotels', rating: 5 } }
        run_test!
      end
      response '200', 'category name updated' do
        let(:category) { { name: 'foo' } }
        run_test!
      end
    end

    put('update category') do
      put('update category') do
        let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        tags 'Categories'
        consumes 'application/json'
        parameter name: :category, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            rating: { type: :integer, default: :null, comment: 'When added, ranges strictly from 1 to 5 inclusive.' }
          },
          required: %w[name description]
        }

        response '200', 'category updated' do
          let(:category) { { name: 'Platinum', description: 'Top rated hotels' } }
          run_test!
        end
        response '200', 'success!' do
          let(:category) { { name: 'foo' } }
          run_test!
        end
      end
    end

    delete('delete category') do
      tags 'Categories'
      response(204, 'successful') do
        let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        run_test!
      end
    end
  end
end
