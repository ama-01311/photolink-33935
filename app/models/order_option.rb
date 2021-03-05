class OrderOption < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  has_one :option

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :theme
  belongs_to :flame
  belongs_to :type
  belongs_to :prefecture
              
end
