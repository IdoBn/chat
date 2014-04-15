class	ConversationsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_user, only: [:show]

	def index
		@conversations = current_user.conversations
	end

	def show
		@conversation = Conversation.find(params[:id])
		@messages = @conversation.messages
	end

	private
		def check_user
			@conversation = Conversation.find(params[:id])
			unless @conversation.users.include?(current_user)
				render :nothing => true, :status => 401
			end
		end
end