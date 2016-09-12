class CreateNflTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :nfl_teams do |t|
      t.string :code
      t.string :full_name
      t.string :short_name

      t.timestamps
    end
  end
end
