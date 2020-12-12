class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: {maximum:7}
  validates :encrypted_password,     presence: true {maximum:7}
  validates :email,     presence: true :kind, inclusion: { in: %w(@) }
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } #
end