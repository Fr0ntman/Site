10.times do |i|
	Course.create!(
		title: Faker::Name.title,
		bg_img: Faker::Placeholdit.image('960x540'),
		color: Faker::Color.hex_color,
		description: Faker::Lorem.paragraph(2),
		number: Faker::Number.number(4),
		level: Faker::Lorem.word,
		original_course_link: Faker::Internet.url,
		teacher: Faker::Name.name,
		category: Faker::Lorem.word,
		sub_category: Faker::Lorem.word,
		speciality: Faker::Lorem.word,
    date_of_creating: Faker::Number.number(5)
	)
end