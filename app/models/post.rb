class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments

  default_scope { order('created_at DESC') }
end
