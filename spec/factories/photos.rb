FactoryBot.define do
  factory :photo do
    photo_title                 { 'test' }
    photo_description           { 'test' }
    photo_category_id           { '2' }
    photo_place_id              { '2' }
    selling_price               { '500' }
    association :user

    after(:build) do |photo|
      photo.image.attach(io: File.open('app/assets/images/comment.png'), filename: 'comment.png', content_type: 'image/png')
    end
  end
end
