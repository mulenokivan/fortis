class CvsController < ApplicationController
  before_action :set_cv, only: %i[show edit update destroy destroy_avatar]

  def index
    @cvs = Cv.all
  end

  def show
    @content_block = @cv.content_blocks.build
  end

  def new
    @cv = Cv.new
  end

  def create
    @cv = Cv.new(cv_params)

    if @cv.save
      redirect_to @cv, notice: "Cv was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @cv.update(cv_params)
      redirect_to @cv, notice: "Cv was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy_avatar
    @cv.avatar.purge
    redirect_to @cv
  end

  def destroy
    @cv.destroy
    redirect_to cvs_url, notice: "Cv was successfully destroyed.", status: :see_other
  end

  private

    def set_cv
      @cv = Cv.find(params[:id])
    end

    def cv_params
      params.require(:cv).permit(:name, :surname, :patronymic, :avatar)
    end
end
