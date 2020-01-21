class User < ApplicationRecord
    has_many :document_access
    has_many :documents, through: :document_access
    has_many :friendships, foreign_key: 'user'
    has_many :friendships, foreign_key: 'friend_user'
    has_many :users, through: :friendships, foreign_key: 'friend_user'
    has_many :messages, through: :friendships
end
