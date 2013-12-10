class Club < ActiveRecord::Base

	geocoded_by :post_code   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

end
