class HomeController < ApplicationController
  def index
    if current_user
      @leagues = current_user.leagues
      @pending_invites = Invite.list_user_invites(current_user.id)
      
      #@league_invites = @pending_invites.leagues
    else
      @leagues = []
    end
  end

  def member_join(current_user)
    @league.memberships << current_user
    redirect_to @league.show
  end


end
