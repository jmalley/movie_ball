class Studio < ActiveRecord::Base
    validates :name, uniqueness: { scope: :league_id, message: "Another studio in this league already has that name." }

    has_many :movies, :dependent => :destroy

    has_many :studio_ownerships
    has_many :users, :through => :studio_ownerships

    belongs_to :league

    # not currently in user
    # def movies_for(studio, league)
    #   studio.movies.where(league_id: league.id)
    # end


    # need to fire off when prompted by user?
    # after_create :populate_categories

    # def populate_categories
    #   if studio.movies.empty?
    #     studio.movies.create!(:user_id => user.id, :category => 'Critical Darling')
    #     studio.movies.create!(:user_id => user.id, :category => 'UltraSnub')
    #     studio.movies.create!(:user_id => user.id, :category => 'Actors Access')
    #     studio.movies.create!(:user_id => user.id, :category => 'Doc/Foreign/Animation')
    #     studio.movies.create!(:user_id => user.id, :category => 'Early Release')
    #   else
    #     # todo: check selected movie status
    #   end
    # end

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
