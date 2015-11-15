class User < ActiveRecord::Base
  has_many :posts
  validates :name, length: { minimum: 3, maximum: 50 }
  validates_format_of :email, with: EMAIL_FORMAT
  validates :email, uniqueness: true
  has_secure_password
end
