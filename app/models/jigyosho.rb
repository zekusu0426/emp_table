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
#  flg        :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Jigyosho < ActiveRecord::Base
  validates :cd, presence: true
  validates :cd, length: { in: 1..10 }, allow_blank: true

  validates :name, presence: true
  validates :name, length: { in: 1..60 }, allow_blank: true

  validates :ryakusho, presence: true
  validates :ryakusho, length: { in: 1..30 }, allow_blank: true

  validates :from_ymd, presence: true
  validates :from_ymd, length: { is: 8 }, allow_blank: true

  validates :to_ymd, length: { is: 8 }, allow_blank: true

  validates :mail, length: { in: 1..50 }, allow_blank: true

  validates :sort_num, length: { in: 1..10 }, allow_blank: true

  validates :flg, presence: true
  validates :flg, length: { in: 1..2 }, allow_blank: true

end
