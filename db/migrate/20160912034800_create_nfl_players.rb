class CreateNflPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :nfl_players do |t|
      t.string :ffn_id
      t.boolean :active
      t.integer :jersey
      t.string :lname
      t.string :fname
      t.string :display_name
      t.string :team
      t.string :position
      t.string :height
      t.string :weight
      t.date :dob
      t.string :college

      t.timestamps
    end
  end
end
