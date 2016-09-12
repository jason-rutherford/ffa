json.extract! nfl_schedule, :id, :game_week, :game_date, :away_team, :home_team, :game_time_et, :tv_station, :created_at, :updated_at
json.url nfl_schedule_url(nfl_schedule, format: :json)