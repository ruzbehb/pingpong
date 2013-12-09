class Score < ActiveRecord::Base

	has_many :games
	belongs_to :player
	belongs_to :match
	
end
