class Schedule < ActiveRecord::Base
	belongs_to :course

	validates :topic,:presence=>true
	validates :course_id,:presence=>true
end
