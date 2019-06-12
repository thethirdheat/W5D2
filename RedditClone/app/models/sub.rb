class Sub < ApplicationRecord
  validates :moderator, :description, :title, presence: true
  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: 'User'
  
  has_many :posts,
    foreign_key: :sub_id,
    class_name: 'Post'
end
