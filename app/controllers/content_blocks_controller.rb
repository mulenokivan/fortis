class ContentBlocksController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      content = params[:content_block][:content_type].constantize.create!
      @content_block = ContentBlock.create!(content_block_params.merge(content_id: content.id))
    end
    redirect_to @content_block.cv
  end

  def change_position
    params[:content_blocks].each do |content_block|
      next if content_block[:id].blank?
      ContentBlock.find(content_block[:id]).update_attribute(:position, content_block[:position])
    end
  end

  private
    def content_block_params
      params.require(:content_block).permit(:cv_id, :position, :hidden, :content_type, :content_id)
    end
end
