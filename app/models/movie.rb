class Movie < ActiveRecord::Base

  def self.search(query)
    where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
  
end
