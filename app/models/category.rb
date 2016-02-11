class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, length: { minimum: 3, maximum: 50 }

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def to_s
    self.name
  end
end
