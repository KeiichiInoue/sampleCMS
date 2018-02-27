class RegistrantsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_registrant, only: [:show, :edit, :update, :destroy]
  before_action :set_device_type_hash, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  protect_from_forgery except: :destroy

  # GET /registrants
  # GET /registrants.json
  def index
    @registrants = Registrant.all.order(:code)
  end

  # GET /registrants/1
  # GET /registrants/1.json
  def show
  end

  # GET /registrants/new
  def new
    @registrant = Registrant.new
  end

  # GET /registrants/1/edit
  def edit
  end

  # POST /registrants
  # POST /registrants.json
  def create
    @registrant = Registrant.new(registrant_params)

    respond_to do |format|
      if @registrant.save
        format.html { redirect_to @registrant, notice: t("views.common.success_create", record: record) }
        format.json { render :show, status: :created, location: @registrant }
      else
        format.html { render :new }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrants/1
  # PATCH/PUT /registrants/1.json
  def update
    respond_to do |format|
      if @registrant.update(registrant_params)
        format.html { redirect_to @registrant, notice: t("views.common.success_update", record: record) }
        format.json { render :show, status: :ok, location: @registrant }
      else
        format.html { render :edit }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrants/1
  # DELETE /registrants/1.json
  def destroy
    @registrant.destroy
    respond_to do |format|
      format.html { redirect_to registrants_url, notice: t("views.common.success_delete", record: record) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_registrant
    @registrant = Registrant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def registrant_params
    params.require(:registrant).permit(:name, :device_info, :device_type)
  end

  def set_device_type_hash
    @device_type_hash = Code.get_val_with_name_by_code('DEVICE_TYPE')
  end

  def record
    t("activerecord.models.registrant")
  end
end
