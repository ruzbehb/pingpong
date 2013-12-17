if @match.end_of_current_game?
	json.gameover true
	json.p1games @match.games_for_score(1)
	json.p2games @match.games_for_score(2)
end

json.p1points @match.current_points_for_player(1)
json.p2points @match.current_points_for_player(2)
json.p1games @match.games_for_score(1)
json.p2games @match.games_for_score(2)

if @match.over?
	json.p1games @match.games_for_score(1)
	json.p2games @match.games_for_score(2)
	json.matchover true
end