require 'rubygems'
require 'rest-client'
require 'json'

class LcuApiService

    def self.get_match_data(password, port, match_id)

        # Set up the LCU API URL for match history data
        match_history_url = "https://127.0.0.1:#{port}/lol-match-history/v1/games/#{match_id}"

        # Set up authentication using your LCU credentials
        auth = { username: "riot", password: password }

        # Make the GET request to the LCU API
        response = RestClient::Request.execute(
        method: :get,
        url: match_history_url,
        user: auth[:username],
        password: auth[:password],
        verify_ssl: false
        )

        # Check if the request was successful (status code 200)
        if response.code == 200
            return JSON.parse(response.body)
        else
            puts "Failed to get match history data. Status code: #{response.code}"
            puts response.body
        end

    end
end