class Match < ActiveRecord::Base
	has_and_belongs_to_many :players
	has_many :scores
	has_many :games, :through => :scores
end
