require 'rails_helper'
describe User , type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first＿nameとlast_name、first＿name_readingとlast_name_reading、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "1111a1a"
        @user.password_confirmation = "1111a1a"
        expect(@user).to be_valid
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれていない場合登録できない" do
        @user.email= "aaa.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
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
      expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "password_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        @user.password ="1111a1a"
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      
        it "first_nameがない場合は登録できないこと" do
          @user.first_name= nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
  
        it "first_name_readingがない場合は登録できないこと" do
          @user.first_name_reading= nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end
  
        it "last_nameがない場合は登録できないこと" do
          @user.last_name=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
  
        it "last_name_readingがない場合は登録できないこと" do
          @user.last_name_reading=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading can't be blank")
        end
  
      it "生年月日がか空だと登録できない" do
        @user.birth_date = nil
        @user.valid?
       expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

       it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name="ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name="ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_name_readingが全角カタカナでなければ登録できないこと' do
        @user.first_name_reading="あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end

      it 'last_name_readingが全角カタカナでなければ登録できないこと' do
        @user.last_name_reading= "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end
      end
    end
  end
end