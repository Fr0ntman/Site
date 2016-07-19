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
	news.attachments = [Pathname.new(path_to_files + random_image[rand_int]).open]
	news.save!
end

3.times do |i|
	rand_int = rand(0..7)
	news = News.new title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body
	news.attachments = [Pathname.new(path_to_files + random_image[rand_int]).open]
	news.save!
end

5.times do |i|
	Category.create! title: FFaker::Lorem.word
end

5.times do |i|
	rand_int = rand(1..5)
	sub_category = SubCategory.new title: FFaker::Lorem.word
	Category.find(rand_int).sub_categories << sub_category
end

5.times do |i|
	rand_int = rand(1..5)
	speciality = Speciality.new title: FFaker::Lorem.word
	SubCategory.find(rand_int).specialities << speciality
end

10.times do |i|
	rand_int = rand(0..7)
	rand_category = rand(1..5)
	rand_sub_category = rand(1..5)
	rand_speciality = rand(1..5)
	course = Course.new(
		title: FFaker::CheesyLingo.title,
		color: '#61CDAB',
		description: FFaker::Lorem.paragraph,
		number: FFaker::Lorem.characters(4),
		level: FFaker::Lorem.word,
		original_course_link: FFaker::Internet.http_url,
		teacher: FFaker::NameRU.name,
		category: rand_category,
		sub_category: rand_sub_category,
		speciality: rand_speciality,
    date_of_creating: FFaker::Time.date
	)
	course.bg_img = Pathname.new(path_to_files + random_image[rand_int]).open
	3.times do |j|
		rand_int = rand(0..7)
		rand_int_for_pdf = rand(0..13)
		lecture = Lecture.new title: FFaker::CheesyLingo.title, description: FFaker::Lorem.paragraph, number: j
		lecture.cover = Pathname.new(path_to_files + random_image[rand_int]).open
		lecture.lecture = Pathname.new(path_to_files + random_pdf[rand_int_for_pdf]).open
		2.times do |k|
			rand_int = rand(0..7)
			task = Task.new number: k
			2.times do |l|
				rand_int_for_pdf = rand(0..13)
				task_file = TaskFile.new number: l, task_type: 'task'
				task_file.file = Pathname.new(path_to_files + random_pdf[rand_int_for_pdf]).open
				task.task_files << task_file
				task_file.save!
				task_solution = TaskFile.new number: l, task_type: 'solution', parent: task_file
				task_solution.file = Pathname.new(path_to_files + random_pdf[rand_int_for_pdf]).open
				task.task_files << task_solution
				task_solution.save!
			end
			task.save!
			lecture.tasks << task
		end
		lecture.save!
		course.lectures << lecture
	end
	course.save!
end
