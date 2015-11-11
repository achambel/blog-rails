class Category < ActiveRecord::Base
  has_many :posts, dependent: :restrict_with_exception
  validates :name, length: { minimum: 3, maximum: 50 }
end
