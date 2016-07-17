FactoryGirl.define do
  factory :news_category do
    sequence(:name) { |n| "news_category_#{n}" }
  end
end
