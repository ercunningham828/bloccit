class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, length: { minimum: 5 }, presence: true

  default_scope { order('created_at DESC') }
end
