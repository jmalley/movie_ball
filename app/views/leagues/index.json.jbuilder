json.array!(@leagues) do |league|
  json.extract! league, :id, :name, :game_type, :logo
  json.url league_url(league, format: :json)
end
