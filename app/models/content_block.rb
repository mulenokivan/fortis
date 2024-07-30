class ContentBlock < ApplicationRecord
  belongs_to :cv
  belongs_to :content, polymorphic: true

  default_scope { order(position: :asc) }
end
