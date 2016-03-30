class DateValidator < ActiveModel::EachValidator
  # YYYYMMDDの8桁、Integer型で構成されている日付をバリデータチェックを行う。
  def validate_each(record, attribute, value)

    # 年月日を正しいか変別するためintegerに変換します。
    ymd = value.to_s
    year = ymd[0..3].to_i
    month = ymd[4..5].to_i
    day = ymd[6..7].to_i
    # 不正な値であるかをymd_correct?で確認します。
    unless ymd_correct?(year,month,day)
      record.errors[attribute] << I18n.t('errors.messages.invalid')
    end

    def ymd_correct?(year,month,day)
      return false unless (1000..2999).include?(year) && (1..12).include?(month)
      if month == 2 && ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0))
        return (1..29).include?(day)
      else
        day_limit = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1]
        return (1..day_limit).include?(day)
      end
    end

  end
end