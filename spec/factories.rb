FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    email 
    password "password"
    password_confirmation "password"
    name "user"
  end

  factory :admin, class: User do
    email "admin@admin.com"
    password "password"
    password_confirmation "password"
    role "admin"
    name "user"
  end

  factory :phrase do
    text "test phrase"
    association :user
  end

  factory :favorite do
    association :user
    association :phrase
  end
end
