class AlphaSignUp < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  def self.list_alphas
    alphas = !where("email is not null").empty?
  end
end
