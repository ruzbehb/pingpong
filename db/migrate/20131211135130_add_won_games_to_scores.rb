class AddWonGamesToScores < ActiveRecord::Migration
  def change
    add_column :scores, :won_games, :integer
  end
end
