class Message < ActiveRecord::Base


	belongs_to :conversation
	after_save :set_current_text

	validates :sender_id, :conversation_id, :message, :presence => true


	def set_current_text
		# is_read= false
		# current_text = ""
	end
end
