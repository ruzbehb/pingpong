class Club < ActiveRecord::Base

	geocoded_by :post_code   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates


	def self.all_near(location)
		
		clubs_near = []
		
		all.each do |club|
			club_data = Hash.new 
			distance = Geocoder::Calculations.distance_between(club.post_code,location).round(1)
			club_data['name'] = club.name
			club_data['distance'] = distance
			club_data['lnk'] = Rails.application.routes.url_helpers.club_path(club)
			clubs_near << club_data
		end
		
	clubs_near.sort_by {|hash| hash[:name]}

	end
end
