require 'rubygems'
require 'rest-client'
require 'json'

# Replace these values with your actual credentials


array_of_summoners = [
    "LeeXiuLong", 
    "10clock01", 
    "cheeserabbit", 
    "Do Not Vape", 
    "StrawberryKiwi", 
    "Reffect",
    "Yasiuu",
    "Quick Kill",
    "jeongle",
    "sleepycornbread",
    "Hbomb30"
    ]


# Set up the LCU API URL for match history data
match_history_url = "https://127.0.0.1:#{port}/lol-match-history/v1/games/#{match_id}"

# Set up authentication using your LCU credentials
auth = { username: username, password: password }

# Make the GET request to the LCU API
response = RestClient::Request.execute(
  method: :get,
  url: match_history_url,
  user: username,
  password: password,
  verify_ssl: false
)

# Check if the request was successful (status code 200)
if response.code == 200
  match_history_data = JSON.parse(response.body)
  puts "Match History Data: #{match_history_data}"
else
  puts "Failed to get match history data. Status code: #{response.code}"
  puts response.body
end