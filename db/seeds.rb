path_to_files = Rails.root.to_s + '/db/seed_files/'
random_image = ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg', '8.jpg']
random_pdf = ['1.pdf', '2.pdf', '3.pdf', '4.pdf', '5.pdf', '6.pdf', '7.pdf', '8.pdf', '9.pdf', '10.pdf', '11.pdf', '12.pdf', '13.pdf', '14.pdf']
random_zip = ['1.zip', '2.zip', '3.zip', '4.zip', '5.zip', '6.zip', '7.zip', '8.zip']

3.times do |i|
	News.create! title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body
end

3.times do |i|
	News.create! title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body, description: FFaker::HipsterIpsum.paragraph(1)
end

3.times do |i|
	rand_int = rand(0..7)
	news = News.new title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body, description: FFaker::HipsterIpsum.paragraph(1)
	news.attachments = [Pathname.new(path_to_file + random_file[rand_int]).open]
	news.save!
end

3.times do |i|
	rand_int = rand(0..7)
	news = News.new title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body
	news.attachments = [Pathname.new(path_to_file + random_file[rand_int]).open]
	news.save!
end

5.times do |i|
	Category.create! title: FFaker::Lorem.word
	SubCategory.create! title: FFaker::Lorem.word
	Speciality.create! title: FFaker::Lorem.word
end

10.times do |i|
	3.times do |j|

	end

	rand_int = rand(0..7)	
	course = Course.new(
		title: FFaker::CheesyLingo.title,
		bg_img: Faker::Placeholdit.image('960x540'),
		color: FFaker::Color.hex_code,
		description: FFaker::Lorem.paragraph,
		number: FFaker::Lorem.characters(4),
		level: FFaker::Lorem.word,
		original_course_link: Faker::Internet.http_url,
		teacher: Faker::NameRU.name,
		category: Category.take,
		sub_category: SubCategory.take,
		speciality: Speciality.take,
    date_of_creating: FFaker::Time.date
    lectures_attributes: [
    	{ 
    		title: FFaker::CheesyLingo.title, 
    		description: FFaker::Lorem.paragraph,
    		number: i,
    		tasks_attributes: [
    			Task.create! number: i,
    			Task.create! number: i
    		]
    	},
    	{ 
    		title: FFaker::CheesyLingo.title, 
    		description: FFaker::Lorem.paragraph,
    		number: i,
    		tasks_attributes: [
    			Task.create! number: i,
    			Task.create! number: i
    		]
    	},
    	{ 
    		title: FFaker::CheesyLingo.title, 
    		description: FFaker::Lorem.paragraph,
    		number: i,
    		tasks_attributes: [
    			Task.create! number: i,
    			Task.create! number: i
    		]
    	}
    ]
    exams_attributes: [{ number: i }]
	)
	course.bg_img = [Pathname.new(path_to_file + random_image[rand_int]).open]
	course.save!
end
