class CreateSummoners < ActiveRecord::Migration[7.1]
  def change
    create_table :summoners do |t|
      t.string :summoner_name
      t.string :discord_name
      t.string :solo_rank
      t.string :flex_rank
      
      t.timestamps
    end
  end
end
