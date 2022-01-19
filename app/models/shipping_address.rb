class ShippingAddress < ApplicationRecord
  belongs_to :purchased_item
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
