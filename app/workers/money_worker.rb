require 'nokogiri'
require 'open-uri'
class MoneyWorker
  include Sidekiq::Worker

  def perform(*args)
    response = URI.open('https://www.cbr.ru/scripts/XML_daily.asp').read
    xml_doc = Nokogiri::XML(response)
    usd = xml_doc.css('Valute').select { |node| node.css('CharCode').text == 'USD' }.first
    return p 0 if usd.nil?

    # TODO: broadcast
    p usd.css('Value').text
  end
end
