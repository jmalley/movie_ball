class Movie < ActiveRecord::Base
  belongs_to :user

  def self.search(query)
    if query.nil?
      return false
    else
      where('title LIKE :query OR description LIKE :query', query: "%#{query}%").order("created_at DESC")
    end
  end
  
end
