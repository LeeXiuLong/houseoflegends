require 'json'

json_content = File.read('C:\Users\Ooi\Documents\Programming\houseoflegends\config\champion_data.json')

json_champ_data = JSON.parse(json_content)
champion_data = json_champ_data["data"]

champion_data.each do |champion_name, data|
    Champion.create(
        champion_name: data["id"],
        api_champion_id: data["key"].to_i,
        games_played: data["games_played"],
        wins: data["wins"]
    )
end

