class Friendship < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :friend_user, class_name: 'User', foreign_key: 'friend_user_id'
  has_many :messages
end
