class	ConversationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@conversations = current_user.conversations
	end

	def show
		@conversation = Conversation.find(params[:id])
		@messages = @conversation.messages
	end
end