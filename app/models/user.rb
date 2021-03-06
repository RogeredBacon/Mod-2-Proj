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
    validates :password, presence: true
    validates :password, length: { in: 4..20 }
    validates :username, length: { in: 3..20 }

    def find_potential
        no_friends = User.all.select{|user| user.friendships.count == 0}
        not_mine = Friendship.all.where("user_id != ? OR friend_user_id != ?", self.id, self.id)
        array =[]
        not_mine.each do |obj| 
            array.push(obj.user)
            array.push(obj.friend_user)
        end
        no_friends.union(array)
    end


end
