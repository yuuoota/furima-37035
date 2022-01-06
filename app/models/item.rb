class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingfee
  belongs_to :prefecture
  belongs_to :deliveryday

  with_options presence: true do
    validates :name
    validates :description

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :delivery_day_id
    end

    validates :price, numericality: { in: 300..9999999 }

  end
end
