3.times do |i|
	News.create! title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body
end

3.times do |i|
	News.create! title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body, description: FFaker::HipsterIpsum.paragraph(1)
end

path_to_file = Rails.root.to_s + '/db/seed_files/'
random_file = ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg', '8.jpg']

3.times do |i|
	rand_int = rand(0..7)
	news = News.create! title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body, description: FFaker::HipsterIpsum.paragraph(1)
	news.attachments = [Pathname.new(path_to_file + random_file[rand_int]).open]
	news.save!
end

3.times do |i|
	rand_int = rand(0..7)
	news = News.create! title: FFaker::DizzleIpsum.sentence, content: FFaker::HTMLIpsum.body
	news.attachments = [Pathname.new(path_to_file + random_file[rand_int]).open]
	news.save!
end