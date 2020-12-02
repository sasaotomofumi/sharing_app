FactoryBot.define do
  factory :share_message do
    content {Faker::Lorem.sentence}
    association  :suggestion
    association  :user

    after(:build) do |share_message|
      share_message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
