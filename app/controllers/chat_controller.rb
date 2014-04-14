class ChatController < WebsocketRails::BaseController
  include ActionView::Helpers::SanitizeHelper

  before_action :authenticate_user!

  def initialize_session
    puts "Session Initialized\n"
  end

  def system_msg(ev, msg)
    broadcast_message ev, { 
      user_name: current_user.email, 
      received: Time.now.to_s(:short), 
      msg_body: msg[:msg_body]
    }
  end

  def private_msg(ev, msg)
    WebsocketRails[:channel].trigger(ev, {
        user_name: current_user.email,
        received: Time.now.to_s(:short),
        msg_body: msg[:msg_body]
      })
  end

  def new_message
		private_msg :new_message, message
  	puts "new message: #{message}" 
  end

  def client_connected
    private_msg :new_message, "client #{client_id} connected"
    puts "private client #{client_id} connected"
  end

  def delete_user
    connection_store[:user] = nil
    private_msg "client #{client_id} disconnected"
    broadcast_user_list
  end
end