class Category < ApplicationRecord
  validates :title, presence: true, length: {maximum: 18}, uniqueness: true

  has_many(
    :tasks,
    class_name: 'Task',
    foreign_key: 'category_id',
    inverse_of: :category,
    dependent: :destroy
  )
  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :categories
  )
end
