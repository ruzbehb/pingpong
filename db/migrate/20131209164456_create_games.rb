class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

    	t.belongs_to :score, index: true

    	t.integer :points
    	t.integer :number

      t.timestamps
    end
  end
end
