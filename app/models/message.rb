class Message < ActiveRecord::Base
	belongs_to :user
	before_save :validateMessage
	def self.get_parent(user_id,reciever_id)
		@message_parent = Message.where('(user_id= ? AND recipient_user_id= ? AND parent_message_id = ? ) OR (user_id= ? AND recipient_user_id= ? AND parent_message_id = ? )', user_id, reciever_id, 0, reciever_id, user_id, 0).order(id: :desc).first
	end
	def self.getMessages(parent)
		if parent != nil
			Message.where('id= ? OR parent_message_id= ?',parent.id,parent.id).order("id asc")
		else
			nil
		end
	end
	def self.getAllMessages(user_id,box)
		if box == 'unread'
			Message.select('DISTINCT ON (user_id) *,messages.id as mid').where('recipient_user_id = ? AND is_read = ?',user_id,false).joins("LEFT JOIN users u ON messages.user_id = u.id")
		elsif box == 'sent'
			Message.select('DISTINCT ON (recipient_user_id) *,messages.id as mid').where('user_id = ?',user_id).joins("LEFT JOIN users u ON messages.recipient_user_id = u.id")
		else
			Message.select('DISTINCT ON (user_id) *,messages.id as mid').where('recipient_user_id = ?',user_id).joins("LEFT JOIN users u ON messages.user_id = u.id")
		end
		
	end	
	def self.setStatusRead(user_id,rid)
		Message.where(:recipient_user_id=>user_id,:user_id=>rid).update_all(:is_read=>true)
	end

	private
	def validateMessage
		if self.parent_message_id == 0
			@parent = Message.get_parent(self.user_id,self.recipient_user_id)
			if @parent != nil
				self.parent_message_id = @parent.id
			else
				self.parent_message_id = 0
			end
		else
			@parent = Message.find(self.parent_message_id)

			if !(@parent.user_id == self.user_id || @parent.user_id == self.recipient_user_id)
				false
			end
		end
	end
end
