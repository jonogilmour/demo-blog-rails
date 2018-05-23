FactoryBot.define do
  factory :comment do
    name "MyString"
    comment "MyText"
  end

  factory :post do
    title "New post"
    content "My cool posting"
  end

end
