class Cv < ApplicationRecord
  has_many :content_blocks, dependent: :destroy
end
