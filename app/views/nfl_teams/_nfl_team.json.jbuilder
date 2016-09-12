json.extract! nfl_team, :id, :code, :full_name, :short_name, :created_at, :updated_at
json.url nfl_team_url(nfl_team, format: :json)