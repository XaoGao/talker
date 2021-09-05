require 'swagger_helper'

describe 'Articles API' do
  path '/api/v1/articles' do
    get 'index articles' do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :session, in: :body, schema: {
        type: :object,
        properties: {
          query: { type: :string },
          page: { type: :integer }
        },
        required: ['query']
      }

      # TODO
      # response '200', 'get all articles' do
        # run_test!
      # end
    end
  end
end
