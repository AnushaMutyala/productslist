FactoryBot.define do
  factory :user do
    id {1}
    email {"anusha2416@gmail.com"}
    password {"1234567"}
    trait :admin do
      roles {'admin'}
    end
     trait :author do
      roles {'author'}
    end
     trait :user do
      roles {'user'}
    end
    # Add additional fields as required via your user user
  end
  # factory :admin do
  #       after(:create) {|user| user.add_role(:admin)}
  # end

  # Not used in this tutorial, but left to show an example of different user types
  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end