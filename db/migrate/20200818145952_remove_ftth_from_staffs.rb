class RemoveFtthFromStaffs < ActiveRecord::Migration[5.2]
  def change
    remove_column :staffs, :ftth
    remove_column :staffs, :tab_new
    remove_column :staffs, :tab_change
    remove_column :staffs, :d_card_g
    remove_column :staffs, :d_card_r
  end
end
