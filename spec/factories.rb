FactoryGirl.define do
  factory :user do
    email "user@user.com"
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
end
