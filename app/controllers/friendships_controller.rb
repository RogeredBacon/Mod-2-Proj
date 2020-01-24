class FriendshipsController < ApplicationController
    before_action :authorize_user

    def index
        @friendships = Friendship.all.where("user_id = ? OR friend_user_id = ?", current_user.id, current_user.id)
        @friendships = @friendships.select{|f| f.confirmed?}
    end

    def new
        @friendship = Friendship.new
        @potential_friends = current_user.find_potential
        requests = Friendship.all.where("friend_user_id = ?", current_user.id)
        @requests = requests.select{|e| !e[:confirmed?]}
    end

    def show 
        @friendship = Friendship.find(params[:id])
    end

    def create
         @friendship = Friendship.create(user_id: current_user.id, friend_user_id: params[:friendship][:friend_user_id], confirmed?: false)
         redirect_to user_path(current_user)
    end

    def confirm
        friend = Friendship.find(params[:id])
        friend.update(confirmed?: true)
        friend.save
        redirect_to new_friendship_path
    end

    def deny
        Friendship.delete(params[:id])
        redirect_to new_friendship_path
    end

    private

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_user_id, :confirmed?)
    end
end
