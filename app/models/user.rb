class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  full_with = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  full_with_message = '全角文字を使用してください'
  kana = /\A[ァ-ヶ一]+\z/
  kana_message = '全角（カタカナ）を使用してください'

  has_many :photos

  with_options presence: true do
    validates :nickname
    validates :lname, format: {with: full_with, message: full_with_message }
    validates :fname, format: {with: full_with, message: full_with_message }
    validates :lname_kana, format: {with: kana, message: kana_message }
    validates :fname_kana, format: {with: kana, message: kana_message }
    validates :birth_date
  end
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を混合して入力してください' }
end
