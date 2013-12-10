class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|

    	t.belongs_to :match, index: true
    	t.belongs_to :player, index: true

      t.timestamps
    end
  end
end
