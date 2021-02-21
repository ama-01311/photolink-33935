class PhotoCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '人物' },
    { id: 3, name: 'スポーツ' },
    { id: 4, name: '動物' },
    { id: 5, name: '魚' },
    { id: 6, name: '虫' },
    { id: 7, name: '風景' },
    { id: 8, name: '建物' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :photos
  end