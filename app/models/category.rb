class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, length: { minimum: 3, maximum: 50 }

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def to_s
    self.name
  end

  def self.top(limit = 1)
    Category.joins(:posts)
            .group('categories.name', 'categories.slug')
            .order('count_id desc')
            .limit(limit)
            .count(:id)
  end
end
