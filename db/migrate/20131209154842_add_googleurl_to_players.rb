class AddGoogleurlToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :google_url, :text
  end
end
