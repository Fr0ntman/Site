# == Schema Information
#
# Table name: courses
#
#  id                   :integer          not null, primary key
#  title                :string           not null
#  bg_img               :string           not null
#  color                :string
#  description          :text             not null
#  number               :string           not null
#  level                :string           not null
#  original_course_link :string           not null
#  teacher              :string           not null
#  category             :string           not null
#  sub_category         :string           not null
#  speciality           :string
#  created_date         :datetime         not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Course < ActiveRecord::Base
  has_many :lectures
  has_many :tasks
  has_many :exams
end