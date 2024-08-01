class Cv < ApplicationRecord
  has_many :content_blocks, dependent: :destroy
  belongs_to :user
  has_one_attached :avatar
  broadcasts_refreshes

  validates :avatar, content_type: {
    in: /\Aimage\/.*\z/,
    message: 'Неподдерживаемый формат картинки. Поддерживаемые форматы: png, jpeg, jpg, svg'
  }
end

# == Schema Information
#
# Table name: cvs
#
#  id         :bigint           not null, primary key
#  name       :string
#  surname    :string
#  patronymic :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
