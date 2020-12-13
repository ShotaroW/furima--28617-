class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password,     presence: true 
end
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :family_name
  validates :first_name
end
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :family_name_kana
  validates :first_name_kana   
end