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

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
