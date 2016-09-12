class CreateNflWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :nfl_weathers do |t|
      t.integer :game_week
      t.date :game_date
      t.string :home_team
      t.string :away_team
      t.string :stadium
      t.string :is_dome
      t.string :geo_lat
      t.string :geo_long
      t.string :low
      t.string :high
      t.string :forcast
      t.string :wind_chill
      t.string :wind_speed
      t.string :dome_img
      t.string :small_img
      t.string :medium_img
      t.string :large_img

      t.timestamps
    end
  end
end
