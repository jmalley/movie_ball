class Membership < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :league
  belongs_to :member_title

  #turn off for testing
  after_create :populate_categories

  def populate_categories

      league.movies.create!(:user_id => user.id, :category => 'Critical Darling')
      league.movies.create!(:user_id => user.id, :category => 'UltraSnub')
      league.movies.create!(:user_id => user.id, :category => 'Actors Access')
      league.movies.create!(:user_id => user.id, :category => 'Doc/Foreign/Animation')
      league.movies.create!(:user_id => user.id, :category => 'Early Release')

  end
 
end
