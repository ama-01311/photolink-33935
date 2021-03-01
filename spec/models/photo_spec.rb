require 'rails_helper'

RSpec.describe Photo, type: :model do
  before do
    @photo = FactoryBot.build(:photo)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '
      photo_titleとphoto_descriptionとphoto_category_idとphoto_place_idと
      selling_priceとimageが揃っていれば出品できる
      ' do
        expect(@photo).to be_valid
      end
    end

    context '出品できない場合' do
      it '画像が添付されていないと出品できない' do
        @photo.image = nil
        @photo.valid?
        #binding.pry
        expect(@photo.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @photo.photo_title = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Photo title can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @photo.photo_description = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Photo description can't be blank")
      end
      it '商品のカテゴリー選択がされていないと出品できない' do
        @photo.photo_category_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Photo category must be other than 1')
      end
      it '商品の状態が選択されていないと出品できない' do
        @photo.photo_place_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Photo place must be other than 1')
      end
      it '販売価格が空だと出品できない' do
        @photo.selling_price = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Selling price can't be blank")
      end
      it '販売価格が半角英数字混合では出品できない' do
        @photo.selling_price = 'a300'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Selling price is not a number')
      end
      it '販売価格が半角英字のみでは出品できない' do
        @photo.selling_price = 'aaa'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Selling price is not a number')
      end
      it '販売価格が半角数字でないと出品できない' do
        @photo.selling_price = '３００'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Selling price is not a number')
      end
      it '販売価格が¥300未満の数字だと出品できない' do
        @photo.selling_price = 299
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it '販売価格が¥9,999,999を超える数字だと出品できない' do
        @photo.selling_price = 10_000_000
        @photo.valid?
        expect(@photo             .errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end
    end
  end
end
