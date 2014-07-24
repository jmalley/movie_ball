class League < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships

  has_many :studios
  
  has_one :owner

  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  has_many :invites
  has_many :invited_users, :through => :invites, :source => :recipient

  has_attached_file :logo, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png", 
                    :storage => :s3,
                    :s3_credentials => {
                    :bucket => ENV['BUCKET'],
                    :access_key_id => ENV['S3_ACCESS_KEY'],
                    :secret_access_key => ENV['S3_SECRET_KEY']
                  }
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

end
