class FriendshipsController < ApplicationController

    def index 
        @friendships = Friendship.all
    end

    def show 
        @friendship = Friendship.find(params[:id])
    end
end
