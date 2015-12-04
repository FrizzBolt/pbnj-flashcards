require 'faker'

10.times do
	new_user = User.new(name: Faker::Name.name, email: Faker::Internet.email)
	new_user.password = Faker::Internet.password(6)
	new_user.save
end