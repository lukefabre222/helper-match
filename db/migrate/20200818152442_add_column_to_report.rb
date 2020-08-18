class AddColumnToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :shop_name, :string
  end
end
