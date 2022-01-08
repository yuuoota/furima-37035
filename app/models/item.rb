class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :delivery_day_id
    end

    validates :price, numericality: { only_integer: true, less_than_or_equal_to: 9_999_999,
                                      greater_than_or_equal_to: 300, message: 'must be half-width integer(300~9,999,999)' }
  end
end
