# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
  	players { [create(:player1), create(:player2)] }
  end
end
