class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ update destroy ]

  def update
    if @document.update(document_params)
      redirect_to @document.content_block.cv
    else
      render_alert(@document)
    end
  end

  def destroy
    @document.destroy
    redirect_to @document.content_block.cv
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:content_block_id, :file, :file_name)
    end
end
