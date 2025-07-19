=begin
  TeaOriginのCRUDコントローラ
  Turbo Stream対応
=end
class TeaOriginsController < ApplicationController
  before_action :set_tea_origin, only: %i[ show edit update destroy ]

  # GET /tea_origins
  def index
    @tea_origins = TeaOrigin.order(harvested_on: :desc).page(params[:page]).per(5)
    @tea_origin = TeaOrigin.new
  end

  # GET /tea_origins/1 or /tea_origins/1.json
  def show
  end

  # GET /tea_origins/new
  def new
    @tea_origin = TeaOrigin.new
  end

  # GET /tea_origins/1/edit
  def edit
  end

  # POST /tea_origins
  def create
    @tea_origin = TeaOrigin.new(tea_origin_params)
    respond_to do |format|
      if @tea_origin.save
        format.turbo_stream
        format.html { redirect_to tea_origins_url, notice: "登録しました。" }
      else
        @tea_origins = TeaOrigin.order(harvested_on: :desc).page(params[:page]).per(5)
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("form_tea_origin", partial: "form", locals: { tea_origin: @tea_origin }),
            turbo_stream.replace("tea-map", partial: "map", locals: { tea_origins: TeaOrigin.all.order(harvested_on: :desc) })
          ]
        end
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tea_origins/1 or /tea_origins/1.json
  def update
    respond_to do |format|
      if @tea_origin.update(tea_origin_params)
        format.html { redirect_to @tea_origin, notice: "Tea origin was successfully updated." }
        format.json { render :show, status: :ok, location: @tea_origin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tea_origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_origins/1 or /tea_origins/1.json
  def destroy
    @tea_origin.destroy!

    respond_to do |format|
      format.html { redirect_to tea_origins_path, status: :see_other, notice: "Tea origin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_tea_origin
      @tea_origin = TeaOrigin.find(params[:id])
    end

    def tea_origin_params
      params.require(:tea_origin).permit(:name, :location_name, :latitude, :longitude, :lot_id, :harvested_on, :notes)
    end
end
