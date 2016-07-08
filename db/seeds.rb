10.times do |i|
	Course.create!(
		title: Faker::Name.title,
		bg_img: Faker::Placeholdit.image('960x540'),
		color: Faker::Color.hex_color,
		description: Faker::Lorem.paragraph,
		number: Faker::Number.number(4),
		level: Faker::Lorem.word,
		original_course_link: Faker::Internet.url,
		teacher: Faker::Name.name,
		category: Faker::Lorem.word,
		sub_category: Faker::Lorem.word,
		speciality: Faker::Lorem.word,
    date_of_creating: Faker::Number.number(5)
	)

	Category.create! title: Faker::Lorem.word
	SubCategory.create! title: Faker::Lorem.word
	Speciality.create! title: Faker::Lorem.word

	Lecture.create! title: Faker::Name.title, description: Faker::Lorem.paragraph, number: i
	Task.create! title: Faker::Name.title, number: i
	Exam.create! number: i
		
	News.create! title: Faker::Name.title, content: Faker::Lorem.paragraph(5)
end
