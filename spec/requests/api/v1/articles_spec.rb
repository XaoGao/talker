require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do
  path '/api/v1/articles' do
    get 'list articles' do
      tags 'Get articles'
      description 'Find list of articles'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string, required: true, description: 'Client token'
      parameter name: :query, in: :path, type: :string, required: true, description: 'Query params'

      # response(200, 'successful') do
      #   run_test!
      # end
    end
  end
end
