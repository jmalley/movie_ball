class AdminportalController < ApplicationController
before_action :authenticate_admin!

  def index
    @alphas = AlphaSignUp.all

    # @movies = Movie.find(:all, :select => 'DISTINCT rotten_id', :conditions => ["title IS NOT NIL"])

    @movies = Movie.all.not_nil_or_duplicate
    # binding.pry
  end  
end

