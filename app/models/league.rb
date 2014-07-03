class League < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships

  has_many :movies

  has_one :owner

  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  has_many :invites


end
