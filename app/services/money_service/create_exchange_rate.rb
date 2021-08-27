require 'nokogiri'
require 'open-uri'

module MoneyService
  class CreateExchangeRate < Service
    include Callable
    def call
      nodes = usd_and_eur_rate
      # ActiveRecord::Base.transaction do
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
      response = URI.open(Rails.application.credentials[Rails.env.to_sym][:exchange_rate_source]).read
      Nokogiri::XML(response)
    end
  end
end
