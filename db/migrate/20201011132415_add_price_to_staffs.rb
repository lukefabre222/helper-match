class AddPriceToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :price, :integer
  end
end
