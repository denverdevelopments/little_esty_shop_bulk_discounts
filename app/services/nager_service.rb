# require 'faraday'
# require 'json'

class NagerService
  def three_holidays
    endpoint = "https://date.nager.at/api/v3/NextPublicHolidays/US"
    response = Faraday.get(endpoint)
    # body = response.body
    json = JSON.parse(response.body, symbolize_names: true) # return
  end
end
