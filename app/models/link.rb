class Link < ActiveRecord::Base

  belongs_to :user

    validates :title, presence: true
    validates :user, presence: true
    validates :link, presence: true
    validates :thumbnail, presence: true
    
end
