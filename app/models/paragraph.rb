class Paragraph < ApplicationRecord
  has_one :content_block, as: :content, dependent: :destroy
end

# == Schema Information
#
# Table name: paragraphs
#
#  id         :bigint           not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
