# require 'swagger_helper'

# describe 'Articles API' do
#   path '/api/v1/articles' do
#     get 'index articles' do
#       tags 'Articles'
#       consumes 'application/json'
#       parameter name: :Authorization,
#                 in: :header,
#                 type: :string,
#                 required: true,
#                 description: 'Client token',
#                 default: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJlbWFpbCI6InRlc3RAdGVzdC50ZXN0IiwiZXhwIjo3OTQxODAxNjAwfQ.zpLErslgllgn3NxqrDjz5jxcZG0uOYiuqQhn-Ey3ToI'

#       parameter name: :article, in: :body, schema: {
#         type: :object,
#         properties: {
#           query: { type: :string },
#           page: { type: :integer }
#         },
#         required: ['query']
#       }
#       # TODO
#       response '200', :ok do
#         let(:article) { { query: 'test', page: '0' } }
#         run_test!
#       end

#       # response '401', :unauthorized do
#       #   let(:Authorization) { '' }
#       #   let(:article) { { query: 'test', page: '0' } }
#       #   run_test!
#       # end
#     end
#   end
# end
