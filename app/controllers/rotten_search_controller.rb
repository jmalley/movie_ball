class RottenSearchController < ApplicationController
  include ERB::Util
  
  # Prevent overloading of rottentomatoes
  require 'slowweb'
  SlowWeb.limit('api.rottentomatoes.com', 5, 1)

  def index
    @category = params[:category]
    @category_url_safe = params[:category].encode!
    @movie_id = params[:id]
    @studio_id = params[:studio_id]
    @league_id = params[:league_id]
  end

  def results
    @string = params[:qauto]
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=fhtb9hhbjk334mu269aqkas7&q=#{@string}"
    res = JSON.load(RestClient.get(url))
    @rotten_response = res["movies"]
    
  end
end
