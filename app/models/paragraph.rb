class Paragraph < ApplicationRecord
  has_one :content_block, as: :content, dependent: :destroy
end
