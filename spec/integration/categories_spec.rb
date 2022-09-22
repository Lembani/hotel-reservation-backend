# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Categories API' do
  path '/api/v1/categories' do
    post 'Creates a category' do
      tags 'Cats'
      consumes 'application/json'
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          rating: { type: :integer }
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
    get 'Retrieves a category' do
      tags 'Cats'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 rating: { type: :integer }
               },
               required: %w[id name description]

        let(:id) { Category.create(name: 'Platinum', description: 'Top rated!', rating: 5).id }
        run_test!
      end

      response '200', 'category not found' do
        let(:id) { '' }
        run_test!
      end
    end
  end
end
