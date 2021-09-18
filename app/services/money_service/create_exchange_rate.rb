require 'nokogiri'
require 'open-uri'

module MoneyService
  class CreateExchangeRate < Service
    include Callable
    def call
      nodes = usd_and_eur_rate
      # SaveOperations.transaction do
      last_rate = ExchangeRate.last
      if last_rate.present? && last_rate.current == true
        last_rate.update(current: false)
      end
      rate = ExchangeRate.create(USD: nodes[:USD], EUR: nodes[:EUR], current: true)
      success(rate)
      # end
    end

    private

    def usd_and_eur_rate
      xml_doc = request_to_bank
      usd = current_rate_of(xml_doc: xml_doc, valute: 'USD')
      eur = current_rate_of(xml_doc: xml_doc, valute: 'EUR')
      { USD: usd, EUR: eur }
    end

    def current_rate_of(xml_doc:, valute:)
      xml_doc.css('Valute').select { |node| node.css('CharCode').text == valute }.first.css('Value').text
    end

    def request_to_bank
      if ToggleService.service_active?('money', Rails.env)
        response = URI.open(Rails.application.credentials[Rails.env.to_sym][:exchange_rate_source]).read
      else
        response = '<?xml version=\"1.0\" encoding=\"windows-1251\"?><ValCurs Date="18.09.2021" name="Foreign Currency Market"><Valute ID="R01235">
          <NumCode>840</NumCode><CharCode>USD</CharCode><Nominal>1</Nominal><Name>Доллар США</Name><Value>72,5602</Value></Valute><Valute ID="R01239">
          <NumCode>978</NumCode><CharCode>EUR</CharCode><Nominal>1</Nominal><Name>Евро</Name><Value>85,4614</Value></Valute></ValCurs></xml>'
      end
      Nokogiri::XML(response)
    end
  end
end
