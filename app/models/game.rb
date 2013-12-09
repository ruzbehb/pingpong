class Game < ActiveRecord::Base
	belongs_to :score

	validates :number, presence: true

	def award_point
		self.points += 1
	end

	def completed?
		self.points == 11
	end

end
