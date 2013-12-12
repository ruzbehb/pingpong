class AddAddresscolumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :address_line1, :text
    add_column :players, :address_line2, :text
    add_column :players, :city_town, :text
    add_column :players, :state, :text
    add_column :players, :post_code, :string
    add_column :players, :country, :string
  end
end
