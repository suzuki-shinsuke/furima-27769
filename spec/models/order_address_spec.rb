require 'rails_helper'

describe OrderAddress do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入がうまく行く時' do
      it 'token, user_id, item_id, postal_code, shipping_area_id, sity, address, number, order_id が全て存在する' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'クレカの情報が正しく入っていない（tokenが空）' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code をハイフンを入れて、半角数字で入力してください')
      end
      it 'shipping_area_idが未選択' do
        @order_address.shipping_area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Shipping area must be other than 0')
      end
      it 'shipping_area_idが空白' do
        @order_address.shipping_area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank", "Shipping area is not a number")
      end
      it 'cityが空' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'numberが空' do
        @order_address.number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end
      it 'postal_codeにハイフンが入っていない' do
        @order_address.postal_code = 8_782_738
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code をハイフンを入れて、半角数字で入力してください')
      end
      it 'numberにハイフンが入っている' do
        @order_address.number = '090-3843-3848'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Number にはハイフンを入れずに、10桁又は11桁の半角数字を使用してください')
      end
      it 'numberが11桁以上' do
        @order_address.number = '090384757763'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Number にはハイフンを入れずに、10桁又は11桁の半角数字を使用してください')
      end
    end
  end
end
