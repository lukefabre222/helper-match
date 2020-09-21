class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.where(staff_id: params[:staff_id])
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
  end

  # POST /events
  # POST /events.json
  def create
    @staff = Staff.find(params[:staff_id])
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to staff_events_path(@event.staff_id), notice: 'Event was successfully created.' }
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
        format.html { redirect_to staff_event_path(@event.staff_id), notice: 'Event was successfully updated.' }
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
      format.html { redirect_to staff_events_path(@event.staff_id), notice: 'Event was successfully destroyed.' }
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
      params.require(:event).permit(:shop_name, :work_type, :start_date, :end_date, :staff_id)
    end
end
