class Link < ActiveRecord::Base

  belongs_to :user
  belongs_to :subreddit
  has_many :comments

  validates :title, presence: true
  validates :user, presence: true
  validates :link, presence: true, format: {:with => /\Ahttp:|https:\/\//}
  validates :thumbnail, presence: true
  validates :subreddit, presence: true

  default_scope { order(votes: :desc) }

end
