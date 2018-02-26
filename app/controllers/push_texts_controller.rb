class PushTextsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_push_text, only: [:show, :edit, :update, :destroy]
  before_action :set_search_params, only: [:index]
  before_action :set_selectable_registrant, only: [:index, :new, :create, :edit, :update]

  # GET /push_texts
  # GET /push_texts.json
  def index
    @q = PushText.search(params[:q])
    @push_texts = @q.result.includes(:registrant).references(:registrant).order(:code, :pushed_at)
  end

  # GET /push_texts/1
  # GET /push_texts/1.json
  def show
  end

  # GET /push_texts/new
  def new
    @push_text = PushText.new
  end

  # GET /push_texts/1/edit
  def edit
  end

  # POST /push_texts
  # POST /push_texts.json
  def create
    @push_text = PushText.new(push_text_params)

    respond_to do |format|
      if @push_text.save
        format.html { redirect_to @push_text, notice: t("views.common.success_create", record: record) }
        format.json { render :show, status: :created, location: @push_text }
      else
        format.html { render :new }
        format.json { render json: @push_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /push_texts/1
  # PATCH/PUT /push_texts/1.json
  def update
    respond_to do |format|
      if @push_text.update(push_text_params)
        format.html { redirect_to @push_text, notice: t("views.common.success_update", record: record) }
        format.json { render :show, status: :ok, location: @push_text }
      else
        format.html { render :edit }
        format.json { render json: @push_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_texts/1
  # DELETE /push_texts/1.json
  def destroy
    @push_text.destroy
    respond_to do |format|
      format.html { redirect_to push_texts_url, notice: t("views.common.success_delete", record: record) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_push_text
    @push_text = PushText.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def push_text_params
    params.require(:push_text).permit(:registrant_id, :detail, :pushed_at)
  end

  def search_params
    params.require(:q).permit(:code_eq, :registrant_id_eq)
  end

  def set_search_params
    if !params[:q].present? && params[:reg_id].present?
      params[:q] = {}
      params[:q][:registrant_id_eq] = params[:reg_id].to_i
    end
  end

  def set_selectable_registrant
    @selectable_registrant = Registrant.all
  end

  def record
    t("activerecord.models.push_text")
  end
end
