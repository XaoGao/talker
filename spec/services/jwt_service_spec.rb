require 'rails_helper'

RSpec.describe JwtService do
  describe 'token' do
    let(:token) do
      'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJlbWFpbCI6InRlc3RAdGVzdC50ZXN0IiwiZXhwIjo3OTQxODAxNjAwfQ.zpLErslgllgn3NxqrDjz5jxcZG0uOYiuqQhn-Ey3ToI'
    end
    let(:payload) { { id: '1', email: 'test@test.test' } }
    context '.encode' do
      it 'should be create a new JWT' do
        exp_date_time = DateTime.new(2221, 9, 1, 0, 0, 0)
        expect(JwtService.encode(payload, exp: exp_date_time)).to eq(token)
      end
    end

    context '.decode' do
      it 'should be docded a jwt and get payloads info' do
        decoded_token = JwtService.decode(token)[0]
        expect(decoded_token).to have_key('id')
        expect(decoded_token).to have_key('email')
        expect(decoded_token['id']).to eq(payload[:id])
        expect(decoded_token['email']).to eq(payload[:email])
      end

      it 'should be error and return nil' do
        decoded_token = JwtService.decode(
          'eyJhbGciOiJIUzI1NiJ91.eyJpZCI6IjEiLCJlbWFpbCI6InRlc3RAdGVzdC50ZXN0IiwiZXhwIjo3OTQxODAxNjAwfQ1.zpLErslgllgn3NxqrDjz5jxcZG0uOYiuqQhn-Ey3ToI1'
        )
        expect(decoded_token).to eq(nil)
      end
    end
  end
end
