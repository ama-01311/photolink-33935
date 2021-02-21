class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos

  with_options presence: true do
    validates :nickname
    validates :lname
    validates :fname
    validates :lname_kana
    validates :fname_kana
    validates :birth_date
  end
end
