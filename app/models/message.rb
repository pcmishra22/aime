class Message < ActiveRecord::Base

	enum sender_type: [:SENDER_STUDENT, :SENDER_TEACHER, :SENDER_GUARDIAN]
	belongs_to :conversation
	belongs_to :user, :foreign_key=>'sender_id'
	after_save :set_current_text

	scope :created_after_id, ->(id) {where("id > ?", id)}

	validates :sender_id, :conversation_id, :message, :presence => true


	def sender
		if sender_type == 'SENDER_STUDENT'
			Student.find(sender_id)
		elsif sender_type	== 'SENDER_TEACHER'
			Teacher.find(sender_id)
		elsif sender_type == 'SENDER_GUARDIAN'
			Guardian.find(sender_id)
		end
	end


	def set_current_text
		# is_read= false
		# current_text = ""
	end
end
