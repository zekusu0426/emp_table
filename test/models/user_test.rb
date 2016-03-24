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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
