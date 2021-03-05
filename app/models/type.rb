class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '写真のみ' },
    { id: 3, name: '壁掛け' },
    { id: 4, name: 'スタンド' }
  ]
  include ActiveHash::Associations
  has_many :order_options
  end