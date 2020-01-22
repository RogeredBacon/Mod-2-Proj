class FriendshipsController < ApplicationController
    def index
        @friendships = Friendship.all.where("user_id = ? OR friend_user_id = ?", current_user.id, current_user.id)
    end

    def new

    end
end
