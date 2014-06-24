class User < ActiveRecord::Base
  has_many :movies
  after_create :populate_categories

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def populate_categories
    self.movies.create!(:category => 'Critical Darling')
    self.movies.create!(:category => 'Audience Favorite')
    self.movies.create!(:category => 'crit darl')
    self.movies.create!(:category => 'crit darl')
    self.movies.create!(:category => 'crit darl')
  end
end
