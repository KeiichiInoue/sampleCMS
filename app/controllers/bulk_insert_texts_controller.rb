class BulkInsertTextsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_registrants, only: [:index, :bulk_create]
  before_action :find_dows, only: [:index, :bulk_create]

  def index
  	@bulk_insert_texts = BulkInsertText.new if !@bulk_insert_texts.present?
  end

  def bulk_create
    @bulk_insert_texts = BulkInsertText.new(bulk_insert_text_params)

    respond_to do |format|
      if @bulk_insert_texts.bulk_create
        format.html { redirect_to push_texts_path(reg_id: @bulk_insert_texts.registrant_id), notice: t("views.common.success_create", record: record) }
      else
        format.html { render :index }
      end
    end
  end

  private

  def find_registrants
  	@registrants = Registrant.all
  end

  def find_dows
    @dows = Code.where(type_code: "DOW")
  end

  def bulk_insert_text_params
    params.require(:bulk_insert_text).permit(:registrant_id, :code, :detail, :date, :time, :dow, :detail, :code, :times)
  end

  def record
    t("activerecord.models.push_text")
  end
end
