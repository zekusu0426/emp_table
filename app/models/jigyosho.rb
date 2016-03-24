# == Schema Information
#
# Table name: jigyoshos
#
#  id         :integer          not null, primary key
#  cd         :string(10)       not null
#  name       :string(60)       not null
#  ryakusho   :string(30)       not null
#  from_ymd   :integer          not null
#  to_ymd     :integer
#  mail       :string(50)
#  sort_num   :integer
#  flg        :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Jigyosho < ActiveRecord::Base
  has_many :users
  attr_accessor :year, :month, :day
  class YmdIsCorrectValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)

      def year_correct?(year)
        return ( 1000 <= year ) && ( year <= 2999 )
      end

      def month_correct?(month)
        return ( 1 <= month ) && ( month <= 12 )
      end

      def day_correct?(day)
        return ( 1 <= day ) && ( day <= 31 )
      end

      ymd = value.to_s
      year = ymd[0..3].to_i
      month = ymd[4..5].to_i
      day = ymd[6..7].to_i

      unless (year_correct?(year) && month_correct?(month) && day_correct?(day))
        record.errors[attribute] << I18n.t('errors.messages.invalid')
      end
    end
  end

  validates :cd, presence: true, uniqueness: true, length: { in: 1..10 }
  
  validates :name, presence: true, length: { in: 1..60 }

  validates :ryakusho, presence: true, length: { in: 1..30 }

  validates :from_ymd, presence: true, length: { is: 8 }, ymd_is_correct: true

  validates :to_ymd, length: { is: 8 }, ymd_is_correct: true, allow_blank: true

  validates :mail, length: { in: 1..50 }, allow_blank: true

  validates :sort_num, length: { in: 1..10 }, allow_blank: true

  validates :flg, presence: true
end
