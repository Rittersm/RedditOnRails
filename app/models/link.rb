class Link < ActiveRecord::Base

  belongs_to :user
  belongs_to :subreddit

  validates :title, presence: true
  validates :user, presence: true
  validates :link, presence: true
  validates :thumbnail, presence: true
  validates :subreddit, presence: true

end
