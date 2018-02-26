class BulkInsertText
  include ActiveModel::Model

  attr_accessor :registrant_id, :code, :detail, :date, :time, :dow, :detail, :code, :times

  define_model_callbacks :save
  before_save :form_validation

  validates :code, presence: true
  validates :time, presence: true
  validates :times, presence: true

  def bulk_create
    if self.valid?
      s_dts = BulkInsertText.get_date_time_arr(self.date, self.time, self.dow, self.times)
      self.create_text_by_date_time(s_dts)
    else
      return false
    end
  end

  def self.get_date_time_arr(date, time, dow, s_times)
    # 設定日時取得処理

    # 設定
    s_times = s_times.to_i
    s_year = date.try(:split, "/").try(:[], 0)
    s_month = date.try(:split, "/").try(:[], 1)
    s_day = date.try(:split, "/").try(:[], 2)
    s_hour = time.try(:split, ":").try(:[], 0)
    s_minutes = time.try(:split, ":").try(:[], 1)
    s_dow = dow
    s_dts = []

    if s_year.present?
      # 日付指定時
      s_dts << DateTime.new(s_year.to_i, s_month.to_i, s_day.to_i, s_hour.to_i, s_minutes.to_i, 00)
    elsif s_dow.present?
      # 曜日指定時
      this_day = Date.today
      s_dt = this_day - (this_day.wday - s_dow.to_i)
      s_times.times {
        s_dts << s_dt
        s_dt = s_dt + 7
      }
    elsif s_hour.present?
      # 時刻指定時
      s_dt = DateTime.now
      s_times.times {
        s_dts << s_dt.change(hour: s_hour.to_i, min: s_minutes.to_i, sec: 00)
        s_dt = s_dt + 1
      }
    end

    s_dts
  end

  def create_text_by_date_time(s_dts)
    # 一括新規作成処理
    begin
      ActiveRecord::Base.transaction do
        s_dts.each do |s_dt|
          push_text = PushText.create!(
            code: self.code,
            registrant_id: self.registrant_id,
            detail: self.detail,
            pushed_at: s_dt
          )
        end
      end
    rescue
      return false
    end
  end

end
