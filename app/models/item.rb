class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :scheduled_delivery_id
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
