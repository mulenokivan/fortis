class ContentBlock < ApplicationRecord
  belongs_to :cv
  belongs_to :content, polymorphic: true

  default_scope { order(position: :asc) }
end

# == Schema Information
#
# Table name: content_blocks
#
#  id           :bigint           not null, primary key
#  cv_id        :bigint           not null
#  position     :integer
#  content_type :string
#  content_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
