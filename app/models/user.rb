class User < ApplicationRecord
    has_many :document_access, dependent: :destroy

    has_many :documents, through: :document_access, dependent: :destroy

    # has_many :friendships, foreign_key: 'user'
    # has_many :friendships, foreign_key: 'friend_user'
    has_many :friendships, ->(user) { where('user_id = ? OR friend_user_id = ?', user.id, user.id)}, dependent: :destroy

    has_many :users, through: :friendships, foreign_key: 'friend_user', dependent: :destroy

    has_many :messages, through: :friendships, dependent: :destroy


    has_secure_password

    validates :first_name, :last_name,  presence: true
    validates :last_name,  presence: true
    validates :username, presence: true , uniqueness: true 

    def contact(data)
        {self => data}
    end
end
