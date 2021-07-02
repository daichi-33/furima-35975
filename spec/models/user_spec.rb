require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録ができるとき' do
      it 'すべての項目への入力が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空だと登録ができない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空の場合、登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が存在しない場合、登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空の場合、登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid',
                                                      "Password confirmation doesn't match Password")
      end

      it 'passwordが５文字以下の場合、登録できない' do
        @user.password = 'asd12'
        @user.password_confirmation = 'asd12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合の入力ではない場合、登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが不一致の場合、登録できない' do
        @user.password = 'asd123'
        @user.password_confirmation = 'qwe456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空の場合、登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end

      it 'last_nameが全角での入力ではない場合、登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが空の場合、登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end

      it 'first_nameが全角での入力ではない場合、登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_kanaが空の場合、登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
      end

      it 'last_name_kanaが全角での入力ではない場合、登録できない' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kanaが空の場合、登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end

      it 'first_name_kanaが全角での入力ではない場合、登録できない' do
        @user.first_name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'birthdayが空の場合、登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
