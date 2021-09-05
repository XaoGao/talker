require 'swagger_helper'

describe 'Sessions API' do
  path '/api/v1/login' do
    post 'Creat a new jwt' do
      tags 'Session'
      consumes 'application/json'
      parameter name: :session, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }

      # TODO
      # response '200', 'user found and genereate a new token' do
        # let(:session) { { email: 'test0@test.com', password: 'password' } }
        # run_test!
      # end
    end
  end
end
