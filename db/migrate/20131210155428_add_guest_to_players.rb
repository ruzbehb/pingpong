class AddGuestToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :guest, :boolean, :default => false
   
  end
end
