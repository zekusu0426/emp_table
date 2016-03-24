class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :emp_id, null:  false, limit: 8
      t.string :name, null: false
      t.string :jigyosho_id
      t.integer :birthday ,null: false, limit: 8
      t.string :phone1
      t.string :phone2
      t.string :zip, null: false , limit: 8
      t.string :address
      t.string :other, limit: 100
      t.integer :flg, null: false, default: 1

      t.timestamps null: false
    end
  end
end
