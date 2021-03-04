class OrderOption < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  has_one :option
end
