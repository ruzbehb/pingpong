class AddDefaultToPointsOnGames < ActiveRecord::Migration
  def change
  	change_column_default :games, :points, 0
  end
end
