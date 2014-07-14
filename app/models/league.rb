class League < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships

  has_many :movies

  has_one :owner

  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  has_many :invites

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

end
