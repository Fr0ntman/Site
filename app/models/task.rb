# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  title      :string           not null
#  number     :integer          not null
#  tasks      :json             not null
#  solutions  :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ActiveRecord::Base
  belongs_to :lecture
  has_many   :task_files
end
