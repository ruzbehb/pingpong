module MatchesHelper

	def table_data(match, player_index, decrement, new_game)
		{:p1g1 => match.score(1).game(1).points, 
			:p2g1 => match.score(2).game(1).points,
			:g1winner => match.winner_of_game(1) || '',
			:p1g2 => match.score(1).game(2).try(:points) || 0,
			:p2g2 => match.score(2).game(2).try(:points) || 0,
			:g2winner => match.winner_of_game(2) || '',
			:p1g3 => match.score(1).game(3).try(:points) || 0,
			:p2g3 => match.score(2).game(3).try(:points) || 0,
			:g3winner => match.winner_of_game(3) || '',
			:p1current_points => match.score(1).current_game.points,
			:p2current_points => match.score(2).current_game.points,
			:rally_winner_index => player_index,
			:decrement => decrement,
			:new_game => new_game
		}
	end
end