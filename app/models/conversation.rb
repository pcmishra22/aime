class Conversation < ActiveRecord::Base

	enum sender_type: [:SENDER_STUDENT, :SENDER_TEACHER, :SENDER_GUARDIAN]
	enum recipient_type: [:RECIPIENT_STUDENT, :RECIPIENT_TEACHER, :RECIPIENT_GUARDIAN]

	has_many :messages

	belongs_to :sender, :class_name=>'User', :foreign_key=>'sender_id'
	belongs_to :recipient, :class_name=>'User', :foreign_key=>'recipient_id'


	def other_user(user)
		s_type = sender_type.dup
		s_type['SENDER_']=''
		user.user_id == sender.id && user.class.name.upcase == s_type ? recipient : sender

	end

	def self.get_or_create(user1, user2, message_text = nil)
		raise "Argument error: parameter1 must be a Student or Teacher, or Guardian" unless %w(Student Teacher Guardian).include?(user1.class.name)
		raise "Argument error: parameter2 must be a Student or Teacher, or Guardian" unless %w(Student Teacher Guardian).include?(user2.class.name)
	 	# user1 is sender
	 	# user2 is recipient
		sender_type = 'SENDER_' + user1.class.name.upcase
		recipient_type = 'RECIPIENT_' + user2.class.name.upcase


		conversation = Conversation.where('
			(sender_id = ? AND sender_type = ? AND recipient_id = ? AND recipient_type=?)
			OR (sender_id = ? AND sender_type = ? AND recipient_id = ? AND recipient_type=?)',
											 user1.user_id, Conversation.sender_types[sender_type], user2.user_id, Conversation.recipient_types[recipient_type],
											 user2.user_id, Conversation.recipient_types[recipient_type], user1.user_id, Conversation.sender_types[sender_type]
		)

		unless conversation.present?
			conversation = Conversation.create({sender_id: user1.user_id, recipient_id: user2.user_id, sender_type:sender_type ,  recipient_type: recipient_type, last_message_text: message_text})
			conversation.messages.create(sender_id: user1.user_id, message: message_text, sender_type:sender_type) if message_text.present?
		end

		conversation

	end

end
