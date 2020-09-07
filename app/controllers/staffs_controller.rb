class StaffsController < ApplicationController
  before_action :logged_in_staff, only: [:edit, :update, :index]
  before_action :correct_staff,   only: [:show, :edit, :update]
  def show
    @staff = Staff.find(params[:id])
    @events = Event.where(staff_id: @staff.id)
  end

  def index 
    @staffs = Staff.all
    report_column = Report.column_names
    @report_column = report_column[2..13]
  end

  def new 
    @staff = Staff.new
  end

  def edit 

  end

  def update 

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

  end

  private

  def staff_params
    params.require(:staff).permit(:name,:email,:password,:password_confirmation)
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
    redirect_to(root_url) unless @staff == current_staff
  end
end
