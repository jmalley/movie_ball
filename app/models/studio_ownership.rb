class StudioOwnership < ActiveRecord::Base
  belongs_to :user
  belongs_to :studio
end
