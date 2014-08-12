class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :league
  belongs_to :member_title

  after_create :make_studio

  def make_studio
    # league.studio.create!(league_id: league.id)
  end


  # after_create :populate_categories

  # def populate_categories
  #   if league.movies.empty?
  #     league.movies.create!(:user_id => user.id, :category => 'Critical Darling')
  #     league.movies.create!(:user_id => user.id, :category => 'UltraSnub')
  #     league.movies.create!(:user_id => user.id, :category => 'Actors Access')
  #     league.movies.create!(:user_id => user.id, :category => 'Doc/Foreign/Animation')
  #     league.movies.create!(:user_id => user.id, :category => 'Early Release')
  #   else
  #     # todo: check selected movie status
  #   end
  # end

  def self.member_list(league_id)
    Membership.where("league_id = :league_id")
  end
 
end
