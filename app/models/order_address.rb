class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "should be 10 to 11 digits" }
    validates :user_id, :item_id, :city, :house_number, :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, order_id: order.id)
  end
end
