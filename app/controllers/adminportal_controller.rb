class AdminportalController < ApplicationController
before_action :authenticate_admin!

  def index
    @alphas = AlphaSignUp.all
    @movies = Movie.select(:rotten_id).distinct
    # binding.pry
  end  
end

