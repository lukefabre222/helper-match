class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @staff = Staff.find(params[:staff_id])
    if @staff.status == 1
      @events = Event.where(staff_id: params[:staff_id])
    else
      @events = Event.where(shop_name: @staff.name)
    end
    @event = Event.new
    @shops = Staff.where(status: 2)
    @staffs = Staff.where(status: 1)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @staff = Staff.find(params[:staff_id])
    @event = Event.new
    @shops = Staff.where(status: 2)
  end

  # GET /events/1/edit
  def edit
    @shops = Staff.where(status: 2)
    @staffs = Staff.where(status: 1)
  end

  # POST /events
  # POST /events.json
  def create
    @staff = Staff.find(params[:staff_id])
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:success] = "スケジュールを作成しました"
        format.html { redirect_to staff_events_path(current_staff.id)}
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        flash[:success] = "スケジュールを更新しました"
        format.html { redirect_to staff_events_path(current_staff.id)}
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      flash[:success] = "スケジュールを削除しました"
      format.html { redirect_to staff_events_path(current_staff.id)}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_staff
      @staff = Staff.find(params[:staff_id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:shop_name, :staff_name, :work_type, :status, :start_date, :end_date, :staff_id)
    end
end
