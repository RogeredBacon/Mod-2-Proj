class MessagesController < ApplicationController
    before_action :authorize_user

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

    def edit
        @message = Message.all.where(id: params[:id]).first
        if @message.data.first.keys.first != current_user
            @friend = @message.data.first.keys.first
        else
            @friend = @message.data.select{|e| e.keys.first != current_user}.first.keys.first
        end
    end

    def update
        
    end
end
