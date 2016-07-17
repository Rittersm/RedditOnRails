class Subreddit < ActiveRecord::Base

  has_many :links

  validates :category, presence: true
  
end
