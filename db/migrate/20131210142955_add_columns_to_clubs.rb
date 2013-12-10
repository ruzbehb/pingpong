class AddColumnsToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :name, :text
    add_column :clubs, :address, :text
    add_column :clubs, :post_code, :string
  end
end
