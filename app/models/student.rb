class Student < ActiveRecord::Base
	belongs_to :user

	def received_conversations
		Conversation.where("recipient_id = ? AND recipient_type  = ?", self.user_id, 0)
	end

	def sent_conversations
		Conversation.where("sender_id = ? AND sender_type  = ?", self.user_id, 0)
	end

	def conversations
		Conversation.where("(sender_id = ? AND sender_type  = ?) OR (recipient_id = ? AND recipient_type  = ?)", self.user_id, 0, self.user_id, 0)
	end

end
