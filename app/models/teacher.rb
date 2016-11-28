class Teacher < ActiveRecord::Base
	belongs_to :user
	has_many :courses


	def received_conversations
		Conversation.where("recipient_id = ? AND recipient_type  = ?", self.id, Conversation.recipient_types[:RECIPIENT_TEACHER])
	end

	def sent_conversations
		Conversation.where("sender_id = ? AND sender_type  = ?", self.id, Conversation.sender_types[:SENDER_TEACHER])
	end

	def conversations
		Conversation.where("(sender_id = ? AND sender_type  = ?) OR (recipient_id = ? AND recipient_type  = ?)", self.id, Conversation.sender_types[:SENDER_TEACHER], self.id, Conversation.recipient_types[:RECIPIENT_TEACHER])
	end

end
