class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :staff, foreign_key: true
      t.integer :follow_id

      t.timestamps
    end
  end
end
