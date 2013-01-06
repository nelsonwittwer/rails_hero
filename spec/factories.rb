FactoryGirl.define do
  factory :video do |v|
    v.sequence(:video_description)     { |n| "Video Description #{n}"}
    v.sequence(:video_title)        {|i| "Video Title #{i}.com"}
    v.youtube_link   "laser cats!"
  end

  factory :user do |u|
    u.sequence(:user_name) { |n| "User#{n}" }
    u.sequence(:email) { |n| "User#{n}@example.com" }
    u.password    "foobar"
    u.password_confirmation "foobar"
    u.role "user"
  end

  factory :admin, parent: :user do |u|
    u.role "admin"
  end

  factory :mentor, parent: :user do |u|
    u.role "mentor"
  end

  factory :student, parent: :user do |u|
    u.role "student"
  end


end