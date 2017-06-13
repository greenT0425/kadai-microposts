# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..10).each do |number|
	user = User.create(name: 'user' + number.to_s,
							email: number.to_s + '@a.a',
							password: number.to_s)
	(1..100).each do |count|
		user.microposts.build(content: 'user' + number.to_s + 'のmicropost' + count.to_s)
	end
	user.save
end

(1..10).each do |num|
	user = User.find(num)
	
	# follow rand (弾かれるのを許容)
	5.times do
		followUser = User.find(rand(10) + 1)
		user.follow(followUser)
	end
	
	# favorite rand (弾かれるのを許容)
	100.times do
		user.do_favorite(Micropost.find(rand(1000) + 1))
	end
	
	user.reload
end
