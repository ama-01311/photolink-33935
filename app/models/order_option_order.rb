class OrderOptionOrder
  include ActiveModel::Model
  attr_accessor :theme_id, :flame_id, :type_id,
                :post_number, :prefecture_id, :municipality, :address, :building, :phone_number, :order_option_id, :user_id, :photo_id,
                #:token

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :theme
    belongs_to :flame
    belongs_to :type
    belongs_to :prefecture
              

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :phone_number, length: { maximum: 11 }, numericality: :only_integer

    validates :user_id
    validates :photo_id

   #validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = OrderOption.create(user_id: user_id, photo_id: photo_id)
    Option.create(theme_id: theme_id, flame_id: flame_id, type_id: type_id,
                  post_number: post_number, municipality: municipality, address: address, prefecture_id: prefecture_id, building: building,
                  phone_number: phone_number, order_option_id: order.id)
  end
end
