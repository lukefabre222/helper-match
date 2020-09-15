class Report < ApplicationRecord
  belongs_to :staff

  def self.csv_attributes
    ["worked_on", "staff_id", "ftth", "tab_new", "tab_change", "d_card_g", "d_card_r", "sls", "h4d", "skp",
      "hs", "mnp", "migration", "reception", "shop_name"]
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      report = new
      report.attributes = row.to_hash.slice(*csv_attributes)
      report.save!
    end
  end
end
