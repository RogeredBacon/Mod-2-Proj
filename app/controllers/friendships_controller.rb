class FriendshipsController < ApplicationController
    def index
        @friendships = Friendship.all.where("user_id = ? OR friend_user_id = ?", current_user.id, current_user.id)
        @friendships = @friendships.select{|f| f.confirmed?}
    end

    def new

    end
end
