class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many(
    :categories,
    class_name: 'Category',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent: :destroy
  )
end
