class ReportsController < ApplicationController

  def index
    @staff = Staff.find(params[:staff_id])
    @reports = Report.where(staff_id: params[:staff_id]).order('worked_on')
  end

  def new
    @staff = Staff.find(params[:staff_id])
    @report = Report.new
  end

  def create
    @staff = Staff.find(params[:staff_id])
    @report = Report.new(report_params)
    if @report.save
      flash[:success]="日報送信に成功しました"
      redirect_to staff_path(params[:staff_id])
    else
      render 'new'
    end
  end

  private

  def report_params
    params.require(:report).permit(:worked_on,:ftth,:tab_new,:tab_change,:d_card_g,:d_card_r,:sls,:h4d,:skp,
                                  :reception,:hs,:mnp,:migration,:staff_id,:shop_name)
  end
end
