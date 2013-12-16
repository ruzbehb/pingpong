class Game < ActiveRecord::Base
	belongs_to :score 
	validates :number, presence: true

	INCREASE = :+
	DECREASE = :-

	def award_point
		 	increase_point_count unless score.match.over?
	end

	def delete_point
		(decrease_point_count if has_point_been_played? unless score.match.over?
	end

	private

	def has_point_been_played?
		self.points != 0
	end

	def report_point_changed
		score.match.point_change 
	end

	def increase_point_count
		modify_points_with(INCREASE)
	end

	def decrease_point_count
		modify_points_with(DECREASE)
	end

	def modify_points_with(operation)
		self.points= self.points.send(operation, 1)
		save
		report_point_changed
	end
end