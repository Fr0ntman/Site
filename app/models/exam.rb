# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  number     :integer          not null
#  title      :string           not null
#  exams      :json             not null
#  answers    :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exam < ActiveRecord::Base
  belongs_to :course
end
