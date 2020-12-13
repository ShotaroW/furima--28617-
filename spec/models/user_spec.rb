require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first＿nameとlast_name、first＿name_readingとlast_name_reading、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      
      it "passwordを2回入力すれば登録できる" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれていない場合登録できない" do
        @user.email= "aaa.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email doesn't have @")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordに半角英語だけだと登録できない" do
        @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password  half-width characters")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "encrypted_passwordがない場合は登録できないこと" do
        user = build(:user, encrypted_password: nil)
        user.valid?
        expect(user.errors[:encrypted_password]).to include("Encrypted_password can't be blank")
      end
      it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
        user = build(:user, encrypted_password: "") 
        user.valid?
        expect(user.errors[:encrypted_password]).to include("Encrypted_password can't be blank")

        it "family_nameがない場合は登録できないこと" do
          user = build(:user, family_name: nil)
          user.valid?
          expect(user.errors[:family_name]).to include("を入力してください")
        end
  
        it "family_name_kanaがない場合は登録できないこと" do
          user = build(:user, family_name_kana: nil)
          user.valid?
          expect(user.errors[:family_name_kana]).to include("を入力してください")
        end
  
        it "first_nameがない場合は登録できないこと" do
          user = build(:user, first_name: nil)
          user.valid?
          expect(user.errors[:first_name]).to include("を入力してください")
        end
  
        it "first_name_kanaがない場合は登録できないこと" do
          user = build(:user, first_name_kana: nil)
          user.valid?
          expect(user.errors[:first_name_kana]).to include("を入力してください")
        end
  
      it "生年月日がか空だと登録できない" do
        @user.birth_date = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("birth_date can't be blank")
       it 'family_nameが全角入力でなければ登録できないこと' do
        user = build(:user, family_name: "ｱｲｳｴｵ")
        user.valid?
        expect(user.errors[:family_name]).to include("は不正な値です")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        user = build(:user, first_name: "ｱｲｳｴｵ")
        user.valid?
        expect(user.errors[:first_name]).to include("は不正な値です")
      end

      it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, family_name_kana: "あいうえお")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("は不正な値です")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, first_name_kana: "あいうえお")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は不正な値です")
      end
      end
    end
  end
end