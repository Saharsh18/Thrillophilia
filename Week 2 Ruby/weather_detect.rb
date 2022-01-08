require 'net/http'
require 'json'


def weather_detect(city)

    params = {
        :access_key => "1eca0554caf0f8a79c542f3d706481fc",  #API Key
        :query => city 
    }

    uri = URI('http://api.weatherstack.com/current')
    uri.query = URI.encode_www_form(params)
    json = Net::HTTP.get(uri)
    api_response = JSON.parse(json)
    puts "The current temperature in #{api_response['location']['name']}(#{api_response['location']['country']}) is #{api_response['current']['temperature']}°C"

end

#Taking the input from the user
puts "Enter a city name to see the current temperature"
city = gets.chomp

#Function Calling 
weather_detect(city) 