# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Club.delete_all
Player.delete_all

clubs = Club.create([{name: 'Finsbury Table Tennis Club', address: 'Finsbury Leisure Centre, Norman Street, London', post_code: 'EC1V 3PU'},
										{name: 'Highbury Table Tennis Club', address: 'Highbury Grove School, 8 Highbury Grove, London', post_code: 'N5 2EQ'},
										{name: 'Crown and Manor', address: 'Wiltshire Row, Islington, London,', post_code: 'N1 5DH'},										
										{name: 'International Students House', address: 'Portland Room, 229 Great Portland Street, London,', post_code: 'W1W 5PN'},		
										{name: 'Irving', address: 'All Saints Church, Monson Road, New Cross, London', post_code: 'SE14 5DJ'},		
										{name: 'Kamarama', address: '20 Farringdon Road, London', post_code: 'EC1M 3HE'},
										{name: 'Zebrano', address: '14-16 Ganton Street, London', post_code: 'W1F 7BT'},
										{name: 'Stepney Green', address: 'Stepney Green School, Ben Jonson Road, London', post_code: 'E1 4SD'},
										{name: 'Natwest Exiles', address: 'Waterloo Suite, Basement Level 1, 1 Prince’s Street, London', post_code: 'EC2R 8BP'},
										{name: 'National Audit Office', address: '157 - 197 Buckingham Palace Road, Victoria, London', post_code: 'SW1W 9SP'},
										{name: 'JOOLA Morpeth Table Tennis Club', address: '2Morpeth School, Morpeth St. entrance, London', post_code: 'E2 0PS'},	
										{name: 'Moberly Table Tennis Club', address: 'Moberley Sports and Education Centre, Kilburn Lane, London', post_code: 'W10 4AH'},	
										{name: 'Minshull Table Tennis Club', address: 'St Mary Magdalene Academy, Liverpool Road, London', post_code: 'N7 8PG'},		
										{name: 'Lambeth Table Tennis Club', address: 'Evelyn Grace Academy, 255 Shakespeare Road, Brixton, London', post_code: 'SE24 0QN'},																				
										{name: 'Tiger and Dragon Table Tennis Club', address: 'Charing Cross Sports Club, Aspenlea Road, Hammersmith, London,', post_code: 'W6 8LH'}										
											])
players = Player.create([{email: "ruzbehb@yahoo.com", name: "Ruzbeh Bacha", password: "12345678", password_confirmation: "12345678", first_name: 'Ruzbeh', last_name: 'Bacha', sex: 'Male', current_location: 'London, United Kingdom', hometown: 'Mumbai, India', image_url: "/assets/ruz_profile.jpg", age: 33},
												{email: "n.l.eskinazi@gmail.com", name: "Natalie Eskinazi", password: "12345678", password_confirmation: "12345678", first_name: 'Natalie', last_name: 'Eskinazi', sex: 'Female', current_location: 'London, United Kingdom', hometown: 'London, England', image_url: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn1/c22.0.86.86/s64x64/1488201_10100715132196751_2127665367_s.jpg", age: 26},
												{email: "alexandria.lawrence@mac.com", name: "Alexandra Lawrence", password: "12345678", password_confirmation: "12345678", first_name: 'Alexandria' , last_name: 'Lawrence', sex: 'Female', current_location: 'London, United Kingdom', hometown: 'Los Angeles, California', image_url: 'https://lh5.googleusercontent.com/-PrRRlM3A_5E/UqH4Rf_iPoI/AAAAAAAAD0Y/8Oj8gf-AGdo/s1296-no/alexandria.jpg', age: 32},
												{email: "willbell@gmail.com", name: "Will Bell", password: "12345678", password_confirmation: "12345678", first_name: 'Will' , last_name: 'Bell', sex: 'Male', current_location: 'London, United Kingdom', hometown: 'London, United Kingdom', age: 33}])
		])