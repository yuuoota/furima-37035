class PurchasedItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  attr_accessor :token
end