class Game < ActiveRecord::Base
	belongs_to :score 
	validates :number, presence: true

	def award_point
		self.points += 1
		save
		score.match.point_change
	end

	def delete_point
		if self.points != 0
			self.points -= 1 
			save
			score.match.point_change
		end
	end

end
