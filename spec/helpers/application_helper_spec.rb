require 'spec_helper'

describe ApplicationHelper do
  describe '#current_rate' do
    context 'exchange rate is exist' do
      let!(:rate) { create(:exchange_rate, current: true) }
      it 'return last exchange rate' do
        expect(helper.current_rate.current).to eq(true)
      end

      it 'return titls of last rate' do
        expect(helper.current_rate_usd).to eq("USD: #{rate.USD}")
      end

      it 'return date of created' do
        expect(helper.current_rate_title).to eq("Данные на #{rate.created_at.strftime('%Y %m %H:%M')}")
      end
    end

    context "last exchange rate isn't exist" do
      let!(:rate) { create(:exchange_rate, current: false) }
      it 'return last exchange rate' do
        expect(helper.current_rate).to eq(nil)
      end

      it 'return titls of last rate' do
        expect(helper.current_rate_usd).to eq('Нет данных')
      end

      it 'return date of created' do
        expect(helper.current_rate_title).to eq('Нет данных')
      end
    end
  end
end
