module WeatherService
  class Requester
    include HTTParty

    def initialize
      @base_url = 'http://api.openweathermap.org/data/2.5/weather?'.freeze
    end

    def response(city, options = {})
      params = generate_params(city, options)
      HTTPParty.get "#{@base_url}#{params}"
    end

    private

    def generate_params(city, options)
      validate! options
      add_city_and_appid! city, options
      convert_options_to_url_params options
    end

    def add_city_and_appid!(city, options)
      options[:q] = city
      options[:appid] = appid
    end

    def validate!(options)
      valid_keys = [:q, :mode, :units, :lang, :appid]
      options.each_key { |key| options.delete(key) unless valid_keys.include?(key) }
    end

    def appid
      # TODO get app id 
    end
  end
end
