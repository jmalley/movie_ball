class AdminportalController < ApplicationController
before_action :authenticate_admin!

  def index
    @alphas = AlphaSignUp.all
    @movies = Movie.all.select("DISTINCT(rotten_id), *").order("id")


    # @movies = Movie.find(:all, :select => 'DISTINCT rotten_id', :conditions => ["title IS NOT NIL"])
    # @movies = Movie.all.group(:rotten_id)
    # select("DISTINCT(badges.id), badges.*").badges.order("badges.id").order("badges.created_at DESC")
    # binding.pry
  end  
end

