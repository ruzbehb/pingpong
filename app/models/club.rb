class Club < ActiveRecord::Base

	geocoded_by :post_code   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates


	def self.all_near(location)
		
		clubs_near = []
		
		all.each do |club|
			club_data = Hash.new 

			distance = Geocoder::Calculations.distance_between(club.post_code,location).round(1)

			if distance
				club_data['name'] = club.name
				club_data['distance'] = distance
				club_data['address'] = club.address
				club_data['post_code'] = club.post_code
				club_data['lnk'] = Rails.application.routes.url_helpers.club_path(club)
				clubs_near << club_data
			end
		end
		clubs_near.reject! {|club| club['distance'].nan? }
		clubs_near.sort_by {|club| club['distance'] }.first(4)
	end
end
