class Post < ActiveRecord::Base
  belongs_to :category
  validates :title, length: { minimum: 3, maximum: 50 }
end
