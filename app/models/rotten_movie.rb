require 'active_resource'

class RottenMovie < ActiveResource::Base
  api_key = URI.encode("fhtb9hhbjk334mu269aqkas7")
  search_string = "Titanic"

  #self.site = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{api_key}?q=Titanic"

  self.site = "http://api.rottentomatoes.com/api/public/v1.0.json"
end