class Schedule < ActiveRecord::Base
	belongs_to :course

	validates :topic,:presence=>true
	validates :course_id,:presence=>true, numericality: { only_integer: true, greater_than: 0 }
	validates :startdate,:presence=>true
	validates :enddate,:presence=>true
	validates :starttime,:presence=>true
	validates :endtime,:presence=>true
	before_save :finalize

	private 
	def finalize
		#self[:startdate] = DateTime.parse(self[:startdate]).strftime('%a %b %d')
	end
end
