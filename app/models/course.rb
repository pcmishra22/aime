class Course < ActiveRecord::Base
	belongs_to :teacher
	has_many :schedules

	validates :name, :presence => true

	def self.my_active_courses(user_id)
		Course.where(:teacherid=>user_id,:status=>true)
	end
end
