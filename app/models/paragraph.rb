class Paragraph < ApplicationRecord
  has_one :content_block, as: :content, dependent: :destroy
  has_rich_text :text
end
