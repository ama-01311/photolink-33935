class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :photo_category
  belongs_to :photo_place

  with_options presence: true do
    validates :photo_title
    validates :photo_category_id
    validates :photo_place_id
    validates :photo_description
    validates :selling_price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' },
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
  
  with_options numericality: { other_than: 1 } do
    validates :photo_category_id
    validates :photo_place_id
  end

  def self.search(search)
    if search != ""
      Photo.where('text LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end
end
