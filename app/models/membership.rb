class Membership < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :league
  belongs_to :member_title

  #turn off for testing
  after_create :populate_categories

  def populate_categories

      league.movies.create!(:user_id => user.id, :category => 'Category 1')
      league.movies.create!(:user_id => user.id, :category => 'Category 2')
      league.movies.create!(:user_id => user.id, :category => 'Category 3')
      league.movies.create!(:user_id => user.id, :category => 'Category 4')
      league.movies.create!(:user_id => user.id, :category => 'Category 5')

  end
 
end