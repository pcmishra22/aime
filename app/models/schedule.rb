class Schedule < ActiveRecord::Base
	belongs_to :course

	validates :topic,:presence=>true
	validates :startdate,:presence=>true
	validates :enddate,:presence=>true
	validates :starttime,:presence=>true
	validates :endtime,:presence=>true
end
