class Document < ApplicationRecord
  has_one :content_block, as: :content, dependent: :destroy
  has_one_attached :file
end
