# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  vk_post_id  :integer
#  attachments :json
#  description :string
#

FactoryGirl.define do
  factory :new_post, class: News do
    sequence(:title) { |n| "News #{n}" }
    content "content"
    sequence(:vk_post_id) { |n| n }
    description "description"
  end
end
