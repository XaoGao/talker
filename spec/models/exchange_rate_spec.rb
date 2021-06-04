# == Schema Information
#
# Table name: exchange_rates
#
#  id         :integer          not null, primary key
#  EUR        :integer          default(0), not null
#  USD        :integer          not null
#  last       :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  describe 'methods' do
    context '.last_rate' do
      let!(:rates) { create_list(:exchange_rate, 4) }
      it 'last rate is not exist' do
        expect(ExchangeRate.last_rate).to eq(nil)
      end

      it 'last rate is exist' do
        rate = create(:exchange_rate, last: true)
        expect(ExchangeRate.last_rate).to eq(rate)
      end
    end
  end
end
