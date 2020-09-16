module ReportsHelper

  def average_column(id, column)
    Report.where(staff_id: id).where(worked_on: (Date.today.beginning_of_month - 180.day)..(Date.today.end_of_month)).average(column).round(1)
  end

  def total_work_days(id)
    Report.where(staff_id: id).where(worked_on: (Date.today.beginning_of_month - 180.day)..(Date.today.end_of_month)).count
  end

  def average_value(column)
    Report.where(worked_on: (Date.today.beginning_of_month - 180.day)..(Date.today.end_of_month)).average(column).round(1)
  end
  
end
