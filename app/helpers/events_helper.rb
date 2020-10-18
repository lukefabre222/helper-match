module EventsHelper

  def request_sum(staff_name)
    Event.where(staff_name: staff_name).where(start_date: (Date.today.beginning_of_month)...(Date.today.end_of_month)).where(status: "申請中").count
  end

  def work_sum(staff_name)
    Event.where(staff_name: staff_name).where(start_date: (Date.today.beginning_of_month)...(Date.today.end_of_month)).where(status: '確定').count
  end

  def price_sum(staff_name)
    Event.where(staff_name: staff_name).where(start_date: (Date.today.beginning_of_month)...(Date.today.end_of_month)).where(status: '確定').sum(:price)
  end
end
