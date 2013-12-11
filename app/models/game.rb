class Game < ActiveRecord::Base
	belongs_to :score 
	validates :number, presence: true

	def award_point
		self.points += 1
		save
		score.match.point_change
		# raise'hello'
		# match.update_game_number

		# if completed?
		# 	score.game_won
		# end
	end

	# def completed?
	# 	self.points == 11
	# end

	def delete_point
		self.points -= 1 if self.points != 0
		score.match.point_change
	end

end
