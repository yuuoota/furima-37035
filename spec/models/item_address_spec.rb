require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_address = FactoryBot.build(:item_address, user_id: user.id, item_id: item.id)
      sleep 0.05
    end

    context '保存できる場合' do
      it '購入のために必須の項目全てが存在すれば登録できる' do
        expect(@item_address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @item_address.building = ''
        expect(@item_address).to be_valid
      end
    end

    context '保存できない場合' do
      it 'post_codeが空だと保存できないこと' do
        @item_address.post_code = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_address.post_code = '1234567'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空だと保存できないこと' do
        @item_address.prefecture_id = 1
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @item_address.municipality = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @item_address.house_number = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @item_address.tel = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telにハイフンを含むと保存できないこと' do
        @item_address.tel = '090-1234-5678'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが9桁以下では保存できないこと' do
        @item_address.tel = '090123456'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上では保存できないこと' do
        @item_address.tel = '090123456789'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @item_address.token = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item_address.user_id = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @item_address.item_id = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
