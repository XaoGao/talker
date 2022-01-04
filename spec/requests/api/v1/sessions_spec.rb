require 'swagger_helper'

RSpec.describe 'api/v1/sessions', type: :request do
  path '/api/v1/login' do
    post('create session') do
      tags 'Login'
      description 'Creates a new jwt'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      # response(200, 'successful') do
      #   run_test!
      # end
    end
  end
end
