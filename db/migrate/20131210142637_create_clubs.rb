class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|

      t.timestamps
    end
  end
end
