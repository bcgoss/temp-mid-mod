FactoryGirl.define do
  factory :user do
    email "MyString"
    password "MyString"
    password_confirmation "MyString"

    factory :user_with_3_links do
      after(:create) do |user, evaluator|
        create_list(:link, 3, user: user)
      end
    end
  end
end
