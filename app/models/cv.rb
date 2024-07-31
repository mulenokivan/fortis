class Cv < ApplicationRecord
  has_many :content_blocks, dependent: :destroy
  has_one_attached :avatar
  broadcasts_refreshes

  validates :avatar, content_type: {
    in: /\Aimage\/.*\z/,
    message: 'Неподдерживаемый формат картинки. Поддерживаемые форматы: png, jpeg, jpg, svg'
  }
end
