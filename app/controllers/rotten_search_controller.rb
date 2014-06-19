class RottenSearchController < ApplicationController

  def index
  end

  def results
    @string = params[:q]
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=fhtb9hhbjk334mu269aqkas7&q=#{@string}"
    res = JSON.load(RestClient.get(url))
    @rotten_response = res["movies"]
    
  end
end
