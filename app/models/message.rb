class Message < ActiveRecord::Base
	before_save :validateMessage
	def self.get_parent(user_id,reciever_id)
		@message_parent = Message.where('(user_id= ? AND recipient_user_id= ? AND parent_message_id = ? ) OR (user_id= ? AND recipient_user_id= ? AND parent_message_id = ? )', user_id, reciever_id, 0, reciever_id, user_id, 0).order(id: :desc).first
	end
	def self.getMessages(parent)
		if parent != nil
			Message.where('id= ? OR parent_message_id= ?',parent.id,parent.id)
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
