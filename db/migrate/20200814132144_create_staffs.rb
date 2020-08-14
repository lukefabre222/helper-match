class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.integer :ftth
      t.integer :tab_new
      t.integer :tab_change
      t.integer :d_card_g
      t.integer :d_card_r

      t.timestamps
    end
  end
end
