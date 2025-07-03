class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: :update
  # GET /events or /events.json
  # def index
  #   @events = Event.where(user: current_user, start_)

  #   redirect_to root_path
  # end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
    if @event.needs_updating?
      flash.now.alert = "You are missing earnings/expenses for this event! Please Add."
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @user = User.find(params[:user_id])

    if params[:is_work].present? && ActiveRecord::Type::Boolean.new.cast(params[:is_work]) == true
      @event.is_work = true
    end
  end

  # GET /events/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /events or /events.json
  def create
    @user = User.find(params[:user_id])
    @event = @user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    @user = @event.user
    respond_to do |format|
      if @event.update(event_params)
        format.json { 
          render json: @event, status: :ok }
        format.html { 
          redirect_to user_event_path(@user, @event), notice: "Event was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: "Event was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.expect(event: [ :title, :description, :location, :start_time, :end_time, :is_work, :dismiss ])
    end
end
