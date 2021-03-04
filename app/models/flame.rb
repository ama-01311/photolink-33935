class Flame < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'なし' },
    { id: 3, name: '木枠' },
    { id: 4, name: 'プラスチック' },
    { id: 5, name: '金属' }
  ]
  include ActiveHash::Associations
  has_many :order_options
  end