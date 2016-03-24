class CreateJigyoshos < ActiveRecord::Migration
  def change
    create_table :jigyoshos do |t|
      t.string :cd, null:  false, limit: 10
      t.string :name, null:  false, limit: 60
      t.string :ryakusho, null: false, limit: 30
      t.integer :from_ymd, null: false, limit: 8
      t.integer :to_ymd, limit: 8
      t.string :mail, limit: 50
      t.integer :sort_num , limit: 10
      t.integer :flg, null: false, default: 1

      t.timestamps null: false
    end
  end
end
