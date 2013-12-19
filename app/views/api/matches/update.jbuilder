json.p1points @match.current_points_for_player(1)
json.p2points @match.current_points_for_player(2)
json.p1games @match.games_for_score(1)
json.p2games @match.games_for_score(2)
json.currently_serving @match.currently_serving

if @match.end_of_current_game?
	json.gameover true
end

if @match.over?
	json.matchover true
end
