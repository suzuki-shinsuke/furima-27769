class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address, :building, :number, :order_id, :token

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :number
    validates :token
    validates :shipping_area_id
    validates :user_id
    validates :item_id
  end

  validates :shipping_area_id, numericality: { other_than: 0 }

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'をハイフンを入れて、半角数字で入力してください' }
  validates :number, format: { with: /\A\d{10,11}\z/, message: 'にはハイフンを入れずに、10桁又は11桁の半角数字を使用してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building: building, number: number, order_id: order.id)
  end
end
