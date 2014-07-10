class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_a_member?(league_id)
    @member = !Membership.where("user_id is #{current_user.id} AND league_id is #{league_id}").empty?
  end
end
