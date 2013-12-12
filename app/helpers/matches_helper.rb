module MatchesHelper

	def table_data(match)
		{:p1g1 => match.scores.first.games[0].points, :p2g1 => match.scores.last.games[0].points}
	end
end