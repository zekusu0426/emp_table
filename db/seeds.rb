# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




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

User.delete_all
10.times do |i|
  User.create(emp_id: "0#{i}",
              name: "test0#{i}",
              jigyosho_id: "0#{rand(1..3)}",
              birthday: 19910101,
              phone1: "08011112222",
              zip:    "#{rand(100..999)}-#{rand(1000..9999)}",
              address: "福岡県福岡市",
              flg: 1)
end



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

Jigyosho.delete_all
4.times do |i| 
  Jigyosho.create(cd: "0#{i}",
                  name: Faker::Company.name,
                  ryakusho: Faker::Company.suffix,
                  from_ymd: 19910101,
                  mail: Faker::Internet.email,
                  sort_num: rand(1..10)
                  )
end