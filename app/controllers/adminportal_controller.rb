class AdminportalController < ApplicationController
before_action :authenticate_admin!

  def index
    @alphas = AlphaSignUp.all
  end  
end
