class MessagesController < ApplicationController
    def show
        @messages = Message.all.where(friendship_id: params[:id])
        if @messages.count == 0; @messages = nil; end
        @friend = Friendship.all.where(id: params[:id]).first
        if @friend.user_id != current_user.id
            @friend = @friend.user
        else
            @friend = @friend.friend_user
        end
    end

    def new
        @message = Message.all.where(id: params[:format]).first
        if @message.data. != current_user.id
            @friend = @friendship.user
        else
            @friend = @friendship.friend_user
        end
    end
end
