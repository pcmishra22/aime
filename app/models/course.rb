class Course < ActiveRecord::Base
	has_many :schedule
	validates :name, :presence => true
	def self.my_active_courses(user_id)
		Course.where(:teacherid=>user_id,:status=>true)
	end
end
