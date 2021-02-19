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
    validates :selling_price
  end
  
  with_options numericality: { other_than: 1 } do
    validates :photo_category_id
    validates :photo_place_id
  end
end
