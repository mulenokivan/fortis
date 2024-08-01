require "test_helper"

class ContentBlockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
