class Image < ApplicationRecord
  has_one :content_block, as: :content, dependent: :destroy
  has_one_attached :file

  validates :file, content_type: {
    in: /\Aimage\/.*\z/,
    message: 'Invalid image format. Available formats: png, jpeg, jpg, svg'
  }
end

# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
