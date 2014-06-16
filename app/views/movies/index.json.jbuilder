json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :description, :rotten_id, :critics_score, :audience_score
  json.url movie_url(movie, format: :json)
end
