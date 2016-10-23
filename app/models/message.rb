class Message < ActiveRecord::Base
	before_save :validateMessage
	def self.get_parent(user_id,reciever_id)
		@message_parent = Message.where('(user_id= ? AND recipient_user_id= ? AND parent_message_id = ? ) OR (user_id= ? AND recipient_user_id= ? AND parent_message_id = ? )', user_id, reciever_id, 0, reciever_id, user_id, 0).order(id: :desc).first
	end
	def self.getMessages(user_msg_id,reciever_id=0,type="thread")
		if(type == "user")
			@parent = get_parent(user_msg_id,reciever_id)
			if @parent != nil
				user_msg_id = @parent.id
			else
				user_msg_id = nil
			end
		end

		if user_msg_id != nil
			Message.where('id= ? OR parent_message_id= ?',user_msg_id,user_msg_id)
		else
			nil
		end
	end
	private
	def validateMessage
		if self.parent_message_id == 0
			@parent = Message.get_parent(self.user_id,self.recipient_user_id)
			if @parent != nil
				self.parent_message_id = @parent.id
			else
				self.parent_message_id = 0
			end
		else
			@parent = Message.find(self.parent_message_id)

			if !(@parent.user_id == self.user_id || @parent.user_id == self.recipient_user_id)
				false
			end
		end
	end
end
