class Category < ActiveRecord::Base
  has_many :posts, dependent: :restrict_with_exception
  validates_presence_of :name
end
