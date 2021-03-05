class Theme < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'クール' },
    { id: 3, name: 'ホット' },
    { id: 4, name: 'ブリリアント' },
    { id: 5, name: 'シャイン' }
  ]
  include ActiveHash::Associations
  has_many :order_options
  end