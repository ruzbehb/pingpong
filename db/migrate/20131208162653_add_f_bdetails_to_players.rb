class AddFBdetailsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :first_name, :string
    add_column :players, :last_name, :string
    add_column :players, :image_url, :text
    add_column :players, :current_location, :text
    add_column :players, :hometown, :text
    add_column :players, :fb_url, :text
  end
end
