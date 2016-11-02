class Mailbox < ActiveRecord::Base
	before_create :recipient_user

	validates :to_email, :presence => true
	validates :end_date, :presence => true , :on => :create_new
	validates :subject, :presence => true , :on => :create_new
	validates :topics, :presence => true , :on => :create_new
	validates :message, :presence => true
	validates_format_of :to_email,:with => Devise::email_regexp

	def self.getAllMails(user_id,box="")
		if box == 'sent'
			Mailbox.select("mailboxes.id as mailid,*").where(:mail_from=>user_id,:parent_id=>0).joins("LEFT JOIN users u ON mailboxes.mail_to = u.id ").order("mailboxes.id desc")
		else
			Mailbox.select("mailboxes.id as mailid,*").where(:mail_to=>user_id,:parent_id=>0).joins("LEFT JOIN users u ON mailboxes.mail_from = u.id ").order("mailboxes.id desc")
		end
	end
	def self.setStatusRead(parent_id)
		Mailbox.where("parent_id = ? OR id = ?",parent_id,parent_id).update_all(:is_read=>true)
	end
	def self.inboxCount(user_id)
		Mailbox.where(:mail_to=>user_id,:is_read=>false).count
	end
	private
	def recipient_user
		if self.to_email != nil
			@r_user = User.where(:email=>self.to_email).first
			if @r_user
				self.mail_to = @r_user.id
			else
				errors.add(:to_email, 'Email address does not exists.')
				return false
			end
		end
	end
end
