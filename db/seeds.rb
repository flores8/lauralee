require 'faker'

# Create Users
5.times do
	user = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: Faker::Lorem.characters(10)
	)
	user.skip_confirmation!
	user.save!
end
users = User.all

# Create Posts
50.times do
	Post.create(
		user: users.sample,
		title: Faker::Lorem.sentence(3),
		body: Faker::Lorem.paragraph
		)
end
posts = Post.all

# Create Comments
100.times do
	Comment.create(
		post: posts.sample,
		body: Faker::Lorem.paragraph
		)
end

User.last.update_attributes!(
	email: 'lauralee@majorfinder.com',
	password: 'helloworld'
)
admin = User.new(
	name: 'Admin User', 
	email: 'admin@lauraleeflores.com',
	password: 'helloworld')
admin.skip_confirmation!
admin.save
admin.update_attribute(:role, 'admin')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
