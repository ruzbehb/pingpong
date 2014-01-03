class AddDefaultToWonGamesOnScores < ActiveRecord::Migration
  def change
  	change_column_default :scores, :won_games, 0
  end
end
