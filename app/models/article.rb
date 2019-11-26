class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # 一緒に削除
  validates :title, presence: true,
            length: { minimum: 5 }
end
