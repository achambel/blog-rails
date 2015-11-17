class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, length: { minimum: 3, maximum: 255 }
  validates_presence_of :content, :category, :user
end