class StaffsController < ApplicationController

  def show
    @staff = Staff.find(params[:id])
  end

  def index 
    @staff = Staff.find(params[:id])
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
      log_in @user
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

end
