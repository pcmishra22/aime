class Guardian < ActiveRecord::Base
	belongs_to :user

	def received_conversations
		Conversation.where("recipient_id = ? AND recipient_type  = ?", self.id, Conversation.recipient_types[:RECIPIENT_GUARDIAN])
	end

	def sent_conversations
		Conversation.where("sender_id = ? AND sender_type  = ?", self.id, Conversation.sender_types[:SENDER_GUARDIAN])
	end

	def conversations
		Conversation.where("(sender_id = ? AND sender_type  = ?) OR (recipient_id = ? AND recipient_type  = ?)", self.id, Conversation.sender_types[:SENDER_GUARDIAN], self.id, Conversation.recipient_types[:RECIPIENT_GUARDIAN])
	end

end
