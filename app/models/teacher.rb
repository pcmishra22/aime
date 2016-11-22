class Teacher < ActiveRecord::Base
	belongs_to :user
	has_many :courses


	def received_messages
		Conversation.where("recipient_id = ? AND recipient_type  = ?", self.id, 2)
	end

	def sent_messages
		Conversation.where("sender_id = ? AND sender_type  = ?", self.id, 3)
	end

	def messages
		Conversation.where("(sender_id = ? AND sender_type  = ?) OR (recipient_id = ? AND recipient_type  = ?)", self.id, 3, self.id, 3)
	end

end
