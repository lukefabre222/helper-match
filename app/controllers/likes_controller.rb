class LikesController < ApplicationController
  before_action :set_staff

  def create
    @like = Like.create(staff_id: current_staff.id, follow_id: params[:staff_id])
    @staff.reload
  end

  def destroy
    @like = Like.find_by(staff_id: current_staff.id, follow_id: params[:staff_id])
    @like.destroy
    @staff.reload
  end

  private

  def set_staff
    @staff = Staff.find(params[:staff_id])
  end
end
