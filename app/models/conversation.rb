class Conversation < ActiveRecord::Base

	enum sender_type: [:SENDER_STUDENT, :SENDER_TEACHER, :SENDER_GUARDIAN]
	enum recipient_type: [:RECIPIENT_STUDENT, :RECIPIENT_TEACHER, :RECIPIENT_GUARDIAN]

	has_many :messages
end
