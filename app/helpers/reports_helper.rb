module ReportsHelper

  def average_colmun(id, colmun)
    Report.where(staff_id: id).where(worked_on: (Date.today.beginning_of_month)..(Date.today.end_of_month)).average(colmun).round(1)
  end

end
