class Post < ActiveRecord::Base
  belongs_to :category
  validates :title, length: { minimum: 3, maximum: 255 }
  validates_presence_of :content, :category
end
