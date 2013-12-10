# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player1 do
  	email 'helloworld@gmail.com'
  	password '12345678'
  	password_confirmation '12345678'
  	provider 'facebook'
  	uid '509597657'
  	name 'Ruzbeh Bacha-ta'
  	first_name 'Ruzbeh'
  	last_name 'Bacha'
  	image_url 'http://graph.facebook.com/509597657/picture?type=square'
  	current_location 'London, United Kingdom'
  	hometown 'Mumbai, India'
  	fb_url 'https://www.facebook.com/ruzbehb'
  	sex 'male'
  	google_url 'https://plus.google.com/106017922227865222929'
  end
end
