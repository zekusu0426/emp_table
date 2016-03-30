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
  # has_many :users
  self.primary_key = "cd"
  # 日付についてのvalidate
  attr_accessor :year, :month, :day

  def convert_sort_num
    if Jigyosho.where.not(cd: self.cd).pluck(:sort_num).include?(self.sort_num)
      self.sort_num += 1
      convert_sort_num 
    else
      return true
    end
  end

  validates :cd,
            presence: true,
            uniqueness: true,
            length: { in: 1..10 }
  
  validates :name,
            presence: true,
            length: { in: 1..60 }

  validates :ryakusho,
            presence: true,
            length: { in: 1..30 }

  # 日付が正しい値が入力されたかを確認します。app/validator/date_validator.rb
  validates :from_ymd,
            presence: true,
            length: { is: 8 },
            format: { with: /\A[a-z0-9]+\z/i },
            date: true

  validates :to_ymd,
            length: { is: 8 },
            format: { with: /\A[a-z0-9]+\z/i },
            date: true,
            allow_blank: true

  validates :mail,
            length: { in: 1..50 },
            allow_blank: true

  validates :sort_num,
            length: { in: 1..10 },
            allow_blank: true

  # 表示順が重複した場合、アラートせずに＋1します。さらに、＋1して重複した場合は、これを繰り返します。
  validate  :convert_sort_num

  validates :flg,
            presence: true
end
