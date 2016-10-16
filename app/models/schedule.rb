class Schedule < ActiveRecord::Base
	belongs_to :course

	validates :topic,:presence=>true
end
