class AddColumnToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :status, :integer
  end
end
