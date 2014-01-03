class AddSexToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :sex, :string
  end
end
