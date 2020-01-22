class FriendshipsController < ApplicationController
    def index
        @friendships = Friendship.all.where("user_id = ? OR friend_user_id = ?", 10, 10)
    end

    def new

    end
end
