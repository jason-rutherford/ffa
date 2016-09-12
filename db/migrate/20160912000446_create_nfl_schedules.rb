class CreateNflSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :nfl_schedules do |t|
      t.integer :game_week
      t.date :game_date
      t.string :away_team
      t.string :home_team
      t.string :game_time_et
      t.string :tv_station

      t.timestamps
    end
  end
end
