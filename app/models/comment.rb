class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :content, :user, :post
  default_scope { order('created_at DESC') }
end
