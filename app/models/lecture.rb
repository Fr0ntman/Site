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
	mount_uploader :cover, LectureCoverUploader
	mount_uploader :multimedia, LectureMultimediaUploader
	mount_uploader :lecture, LectureUploader

  belongs_to :course
  has_many   :tasks, :materials

  accepts_nested_attributes_for :tasks
end
