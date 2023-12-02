FactoryBot.define do
  factory :item do
    item_name {Faker::Commerce.product_name}
    message {Faker::Lorem.sentence}
    category_id {Category.where.not(id: 1).sample.id}
    condition_id {Condition.where.not(id: 1).sample.id}
    shipping_cost_id {ShippingCost.where.not(id: 1).sample.id}
    prefecture_id {Prefecture.where.not(id: 1).sample.id}
    shipping_date_id {ShippingDate.where.not(id: 1).sample.id}
    price {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
