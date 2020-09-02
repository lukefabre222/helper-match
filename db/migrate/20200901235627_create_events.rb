class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :shop_name
      t.string :work_type
      t.datetime :start_date
      t.datetime :end_date
      t.references :staff, foreign_key: true
      t.timestamps
    end
  end
end
