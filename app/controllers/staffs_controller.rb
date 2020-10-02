class StaffsController < ApplicationController
  before_action :logged_in_staff, only: [:edit, :update]
  before_action :correct_staff,   only: [:show, :edit, :update]
  before_action :store_only, only: [:index]

  def show
    @staff = Staff.find(params[:id])
    @events = Event.where(staff_id: @staff.id)
    report_column = Report.column_names
    @report_column = report_column[2..13]
    @request = Event.where(staff_name: @staff.name).where(status:"申請中")
  end

  def index 
    @staffs = Staff.where(status: 1)
    report_column = Report.column_names
    @report_column = report_column[2..13]
  end

  def new 
    @staff = Staff.new
  end

  def new_shop
    @staff = Staff.new
  end

  def edit 
    @staff = Staff.find(params[:id])
  end

  def update 
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_params)
      flash[:success] = "情報を更新しました"
      redirect_to staffs_path
    else
      render 'edit'
    end
  end

  def create 
    @staff = Staff.new(staff_params)
    if @staff.save
      log_in @staff
      flash.now[:success]="新規登録に成功しました"
      redirect_to @staff
    else
      render 'new'
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    flash[:success]="ユーザーを削除しました"
    redirect_to staffs_path
  end

  private
  def store_only
    redirect_to(root_url) unless current_staff.status == 2
  end


  def staff_params
    params.require(:staff).permit(:name,:email,:password,:password_confirmation, :status)
  end

  def logged_in_staff
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  def correct_staff
    @staff = Staff.find(params[:id])
    redirect_to(root_url) unless @staff == current_staff || current_staff.status == 2
  end
end
