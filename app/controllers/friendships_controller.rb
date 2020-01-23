class FriendshipsController < ApplicationController
    before_action :authorize_user

    def index
        @friendships = Friendship.all.where("user_id = ? OR friend_user_id = ?", current_user.id, current_user.id)
        @friendships = @friendships.select{|f| f.confirmed?}
    end

    def new
        @friendship = Friendship.find(params[:id])
        @potential_friends = current_user.find_potential
    end

    def show 
        @friendship = Friendship.find(params[:id])
    end

    def create
         @friendship = Friendship.create(user_id: current_user.id, friend_user_id: params[:friend_user_id], confirmed?: true)
         redirect_to friendship_path(current_user)
    end

    private

    # def friendship_params
    #     params.require(:friendship).permit(:user_id, :friend_user_id, :confirmed?)
    # end
end
