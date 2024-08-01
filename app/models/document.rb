class Document < ApplicationRecord
  has_one :content_block, as: :content, dependent: :destroy
  has_one_attached :file

  after_update :set_filename

  def set_filename
    original_extension = self.file.blob.filename.to_s.split('.').last
    self.file.blob.update(filename: "#{self.file_name}.#{original_extension}") if file.attached? && self.file_name.present?
  end
end

# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  file_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
