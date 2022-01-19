FactoryBot.define do
  factory :item_address do
    token {'tok_abcdefghijk00000000000000000'}
    post_code {'123-4567'}
    prefecture_id {2}
    municipality {'札幌市'}
    house_number {'1-1'}
    building {'札幌マンション'}
    tel {'09012345678'}
  end
end
