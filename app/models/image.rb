class Image < ApplicationRecord
  has_one :content_block, as: :content, dependent: :destroy
  has_one_attached :file

  validates :file, content_type: {
    in: /\Aimage\/.*\z/,
    message: 'Неподдерживаемый формат картинки. Поддерживаемые форматы: png, jpeg, jpg, svg'
  }
end
