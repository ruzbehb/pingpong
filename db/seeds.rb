# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Club.delete_all

clubs = Club.create([{name: 'Finsbury Table Tennis Club', address: 'Finsbury Leisure Centre, Norman Street', post_code: 'EC1V 3PU'},
										{name: 'Highbury Table Tennis Club', address: 'Highbury Grove School, 8 Highbury Grove, London', post_code: 'N5 2EQ'},
										{name: 'Crown and Manor', address: 'Wiltshire Row, Islington, London,', post_code: 'N1 5DH'}										
											])