class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, length: { minimum: 3, maximum: 50 }

  def to_s
    self.name
  end
end
