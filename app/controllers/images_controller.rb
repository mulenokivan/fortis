class ImagesController < ApplicationController
  before_action :set_image, only: %i[ update destroy ]

  def update
    if @image.update(image_params)
      redirect_to @image.content_block.cv
    else
      render_alert(@image)
    end
  end

  def destroy
    @image.destroy
    redirect_to @document.content_block.cv
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:content_block_id, :file, :description)
    end
end
