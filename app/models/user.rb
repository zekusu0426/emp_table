# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  emp_id      :string(8)        not null
#  name        :string           not null
#  jigyosho_id :string
#  birthday    :integer          not null
#  phone1      :string
#  phone2      :string
#  zip         :string(8)        not null
#  address     :string
#  other       :string(100)
#  flg         :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ActiveRecord::Base
  # Jigyoshoとのリレーショナルデータベース用
  # belongs_to :jigyosho, foreign_key: "cd"

  # 社員CDは数字のみ、桁数は1桁から8桁までしか認めない
  VALID_EMP_ID_REGEX = /\A[0-9]{1,8}\Z/i
  # 郵便番号は 三桁の数字 -(ハイフン) 四桁の数字での構成しか認めない
  VALID_ZIP_REGEX = /\A[0-9]{3}\-[0-9]{4}\Z/i
  # 最終的には数字とハイフンのみ
  # VALID_PHONE_REGEX = /\A([0-9]){5,}}\Z/i

  validates :emp_id, presence: true, uniqueness: true, length: { in: 1..8 }
  validates :name, presence: true

  validates :birthday, presence: true, length: { is: 8}

  validates :phone1, presence: true

  validates :zip, presence: true, format: {with: VALID_ZIP_REGEX, message: "正しい郵便番号を入力してください。"}

  validates :address, presence: true

  validates :flg, presence: true
end
