class CreateSummonerMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :summoner_matches do |t|
      t.integer :match_id
      t.references :summoner, foreign_key: true
      t.references :champion, foreign_key: true
      t.boolean :win

      t.timestamps
    end
  end
end
