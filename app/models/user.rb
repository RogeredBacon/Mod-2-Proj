class User < ApplicationRecord
    has_many :document_access
    has_many :documents, through: :document_access
    has_many :friendships, foreign_key: 'user_id'
    has_many :friendships, foreign_key: 'friend_user_id'
    has_many :users, through: :friendships, foreign_key: 'friend_user_id'
    has_many :messages, through: :friendships
end
