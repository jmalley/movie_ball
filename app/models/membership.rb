class Membership < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :league
  belongs_to :member_title

  after_create :populate_categories
  
  def populate_categories
      user.league.movies.create!(:category => 'Category 1')
      user.league.movies.create!(:category => 'Category 2')
      user.league.movies.create!(:category => 'Category 3')
      user.league.movies.create!(:category => 'Category 4')
      user.league.movies.create!(:category => 'Category 5')
  end
end
