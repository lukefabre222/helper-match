class AddImgToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :img, :string
  end
end
