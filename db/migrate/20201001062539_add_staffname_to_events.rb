class AddStaffnameToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :staff_name, :string
  end
end
