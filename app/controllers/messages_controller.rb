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
        @friend = User.all.where(id: params[:format]).first
    end
    
    def create
        @message = Message.new
        @friend = User.all.where(id: params[:format]).first
        friendship_id = Friendship.all.where("user_id = ? AND friend_user_id = ? OR user_id = ? AND friend_user_id = ?", current_user.id, @friend.id, @friend.id, current_user.id).first.id
        @message.friendship_id = friendship_id
        @message.data = []
        @message.data.push({current_user => params[:data]})
        @message.save
        # if @message.data.first.values.first != 0
        # end
        redirect_to edit_message_path(@message)
    end

    def edit
        @message = Message.all.where(id: params[:id]).first
        friendship = Friendship.all.where(id: @message.friendship_id).first
        if friendship.user != current_user
            @friend = friendship.user
        else
            @friend = friendship.friend_user
        end
    end
    
    def update
        @message = Message.all.where(id: params[:id]).first
        @message.data.push({current_user => params[:data]})
        @message.save
        redirect_to edit_message_path
    end
end
