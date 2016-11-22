class Student < ActiveRecord::Base
	belongs_to :user

	def received_conversations
		Conversation.where("recipient_id = ? AND recipient_type  = ?", self.id, 1)
	end

	def sent_conversations
		Conversation.where("sender_id = ? AND sender_type  = ?", self.id, 1)
	end

	def conversations
		Conversation.where("(sender_id = ? AND sender_type  = ?) OR (recipient_id = ? AND recipient_type  = ?)", self.id, 1, self.id, 1)
	end

end
