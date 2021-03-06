class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :first_name,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_reading,format: {with: /\A[ァ-ヶー－]+\z/ } 
    validates :last_name_reading,format: {with: /\A[ァ-ヶー－]+\z/ } 
    validates :birth_date
  end
end