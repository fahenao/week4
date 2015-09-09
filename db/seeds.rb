Project.destroy_all
puts "All projects has been erased"

Entry.destroy_all
puts "All entries has been erased"



10.times do |i|
	p = Project.new(
		title: Faker::Company.name,
		description: Faker::Hacker.say_something_smart
		)
	p.save
	puts p.errors.messages
	5.times do |i|
		e = p.entries.new(
			hour: rand(0..4),
			minute: rand(0..60),
			comment: Faker::Hacker.say_something_smart,
			created_at: Date.current - (i-1).days
			)
			e.save
	end
end
