class User < ActiveRecord::Base

  has_secure_password
  has_many :links

  validates :name, uniqueness: true, format: {:with => /\A[a-z0-9\-_]+\z/}
  validates :email, uniqueness: true, format: {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

  def to_param
    name
  end


end
