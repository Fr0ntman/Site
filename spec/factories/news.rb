FactoryGirl.define do
  factory :news do
    sequence(:title) { |n| "news_#{n}" }
    association :category, factory: :news_category
    description { FFaker::Lorem.sentence }
    content { FFaker::Lorem.paragraph }

    factory :news_published do
      published true
    end
  end
end
