class CreateChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :champions do |t|
      t.string :champion_name
      t.integer :api_champion_id
      t.integer :games_played
      t.integer :wins

      t.index :champion_name, unique: true
      t.index :api_champion_id, unique: true
      t.timestamps
    end
  end
end
