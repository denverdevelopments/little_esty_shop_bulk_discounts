class NagerService
  def three_holidays
    endpoint = "https://date.nager.at/api/v3/NextPublicHolidays/US"
    response = Faraday.get(endpoint)
    # body = response.body
    json = JSON.parse(response.body, symbolize_names: true)[0..2]

    # ["#{json[0][:name]}, #{json[0][:date]}",
    # "#{json[1][:name]}, #{json[1][:date]}",
    # "#{json[2][:name]}, #{json[2][:date]}"]
  end
end
