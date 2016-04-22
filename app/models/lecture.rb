# == Schema Information
#
# Table name: lectures
#
#  id          :integer          not null, primary key
#  course_id   :integer
#  title       :string           not null
#  description :text             not null
#  number      :integer
#  video       :string
#  audio       :string
#  materials   :string
#  slides      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lecture < ActiveRecord::Base
	belongs_to :course
end
