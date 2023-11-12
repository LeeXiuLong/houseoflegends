class AddPositionToSummonerMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :summoner_matches, :role, :string
  end
end
