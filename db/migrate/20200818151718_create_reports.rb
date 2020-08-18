class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.date :worked_on
      t.integer :ftth
      t.integer :tab_new
      t.integer :tab_change
      t.integer :d_card_g
      t.integer :d_card_r
      t.integer :sls
      t.integer :h4d
      t.integer :skp
      t.integer :reception
      t.integer :hs
      t.integer :mnp
      t.integer :migration
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
