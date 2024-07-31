class ParagraphsController < ApplicationController
  before_action :set_paragraph, only: %i[ update destroy ]

  def update
    if @paragraph.update(paragraph_params)
      redirect_to @paragraph.content_block.cv
    else
      render_alert(@paragraph)
    end
  end

  def destroy
    @paragraph.destroy
    redirect_to @paragraph.content_block.cv
  end

  private
    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    def paragraph_params
      params.require(:paragraph).permit(:content_block_id, :text)
    end
end
