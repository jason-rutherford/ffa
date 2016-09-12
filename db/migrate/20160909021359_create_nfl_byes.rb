class CreateNflByes < ActiveRecord::Migration[5.0]
  def change
    create_table :nfl_byes do |t|
      t.string :team
      t.string :bye_week
      t.string :display_name

      t.timestamps
    end
  end
end
