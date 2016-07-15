class User < ActiveRecord::Base

  has_many :links

  validates :name, presence: true
  validates :email, presence: true  

end
