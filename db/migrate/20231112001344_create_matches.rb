class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.integer :match_id, null: false

      t.index :match_id, unique: true
      t.timestamps
    end
  end
end
