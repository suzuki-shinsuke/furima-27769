FactoryBot.define do
  factory :item do
    name  { 'マグロ三種盛り' }
    info  { '大トロ、中トロ、赤身' }
    price { 2000 }
    category_id { 1 }
    status_id { 1 }
    shipping_fee_id { 1 }
    shipping_area_id { 1 }
    scheduled_delivery_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
