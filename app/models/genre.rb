class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '旅行' },
    { id: 3, name: '教育' },
    { id: 4, name: '音楽' },
    { id: 5, name: '料理' },
    { id: 6, name: '漫画・アニメ' },
    { id: 7, name: 'Vlog' },
    { id: 8, name: 'ペット' },
    { id: 9, name: 'ゲーム' },
    { id: 10, name: 'VTuber' },
    { id: 11, name: 'ビジネス' },
    { id: 12, name: 'カップル' },
    { id: 13, name: 'バラエティ' },
    { id: 14, name: 'フィットネス' },
    { id: 15, name: 'メイク・ファッション' },
    { id: 16, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :videos
end
