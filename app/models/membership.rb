class Membership < ActiveRecord::Base
  has_and_belongs_to_many :users

  #after_create :populate_categories
  #
  #def populate_categories
  #    self.user.movies.create!(:category => 'Category 1')
  #    self.user.movies.create!(:category => 'Category 2')
  #    self.user.movies.create!(:category => 'Category 3')
  #    self.user.movies.create!(:category => 'Category 4')
  #    self.user.movies.create!(:category => 'Category 5')
  #end
end
