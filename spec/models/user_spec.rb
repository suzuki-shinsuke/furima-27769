require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在する' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに「＠」がない' do
        @user.email = 'aabb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下' do
        @user.password = 'aaff3'
        @user.password_confirmation = 'aaff3'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字だけ' do
        @user.password = 'aabbcc'
        @user.password_confirmation = 'aabbcc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字だけ' do
        @user.password = '112233'
        @user.password_confirmation = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは存在するが、password_confirmationが空' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの両方が存在するが、一致していない' do
        @user.password_confirmation = '1122qq'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name には全角を使用してください')
      end
      it 'last_nameが半角' do
        @user.last_name = 'yakiniku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name には全角を使用してください')
      end
      it 'first_nameが空' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name には全角を使用してください')
      end
      it 'first_nameが半角' do
        @user.first_name = 'yakiniku'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角を使用してください')
      end
      it 'last_name_kanaが空' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana には全角カナを使用してください')
      end
      it 'last_name_kanaが漢字' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カナを使用してください')
      end
      it 'last_name_kanaが平仮名' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カナを使用してください')
      end
      it 'last_name_kanaが半角' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カナを使用してください')
      end
      it 'first_name_kanaが空' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana には全角カナを使用してください')
      end
      it 'first_name_kanaが漢字' do
        @user.first_name_kana = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana には全角カナを使用してください')
      end
      it 'first_name_kanaが平仮名' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana には全角カナを使用してください')
      end
      it 'first_name_kanaが半角' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana には全角カナを使用してください')
      end
      it 'birth_dateが空' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
