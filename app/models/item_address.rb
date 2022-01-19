class ItemAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :municipality, :house_number, :building, :tel
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :tel, format: {with: /\d{10,11}/, message: "is invalid"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, tel: tel, purchased_item_id: purchased_item.id)
  end
end