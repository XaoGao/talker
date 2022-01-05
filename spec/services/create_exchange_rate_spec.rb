require 'rails_helper'

describe MoneyService::CreateExchangeRate do
  describe '.create_exchange_rate_spec' do
    context 'exist old rates' do
      let!(:money_service) { create(:toggle_service, name: 'money', env: 'test', work: false) }
      let!(:rates) { create_list(:exchange_rate, 3) }
      it 'success' do
        result = MoneyService::CreateExchangeRate.call
        rates_from_repo = ExchangeRate.where(current: true)
        expect(result.success?).to be true
        expect(rates_from_repo.count).to eq(1)
      end

      it 'exist last rate' do
        create(:exchange_rate, current: true)
        result = MoneyService::CreateExchangeRate.call
        expect(ExchangeRate.where(current: true).count).to eq(1)
        expect(ExchangeRate.all.count).to eq(5)
        expect(result.data.current).to be true
        expect(ExchangeRate.find(4).current).to be false
      end
    end
  end
end
