json.p1points @match.current_points_for(1)
json.p1games @match.scores.first.won_games
json.p2points @match.current_points_for(2)
json.p2games @match.scores.last.won_games

