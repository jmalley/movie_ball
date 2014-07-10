class HomeController < ApplicationController
  def index
    @leagues = League.all

    
  end

  def member_join(current_user)
    @league.memberships << current_user
    redirect_to @league.show
  end


end
