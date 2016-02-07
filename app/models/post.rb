class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, length: { minimum: 3, maximum: 255 }
  validates_presence_of :content, :category, :user
  default_scope { order('created_at DESC') }

  def to_s
    self.title
  end
end
