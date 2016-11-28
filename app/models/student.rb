class Student < ActiveRecord::Base
	belongs_to :user

	def received_conversations
		Conversation.where("recipient_id = ? AND recipient_type  = ?", self.user_id, Conversation.recipient_types[:RECIPIENT_STUDENT])
	end

	def sent_conversations
		Conversation.where("sender_id = ? AND sender_type  = ?", self.user_id, Conversation.sender_types[:SENDER_STUDENT])
	end

	def conversations
		Conversation.where("(sender_id = ? AND sender_type  = ?) OR (recipient_id = ? AND recipient_type  = ?)", self.user_id, Conversation.sender_types[:SENDER_STUDENT], self.user_id, Conversation.recipient_types[:RECIPIENT_STUDENT])
	end

end
