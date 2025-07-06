class EarningsController < ApplicationController
  before_action :set_earning, only: %i[ show edit update destroy ]

  # GET /earnings/1 or /earnings/1.json
  def show
    @event = @earning.event
    @user = @event.user
  end

  # GET /earnings/new
  def new
    @earning = Earning.new
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
  end

  # GET /earnings/1/edit
  def edit  
    @event = @earning.event
    @user = @event.user
  end

  # POST /earnings or /earnings.json
  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @earning = @event.earnings.new(earning_params)

    respond_to do |format|
      if @earning.save
        format.html { redirect_to user_event_path(@user, @event), notice: "Earning was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /earnings/1 or /earnings/1.json
  def update
    @event = @earning.event
    @user = @event.user
    respond_to do |format|
      if @earning.update(earning_params)
        format.html { redirect_to user_event_path(@user, @event), notice: "Earning was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earnings/1 or /earnings/1.json
  def destroy
    @event = @earning.event
    @user = @event.user
    @earning.destroy!

    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event), status: :see_other, notice: "Earning was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_earning
      @earning = Earning.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def earning_params
      params.expect(earning: [ :title, :description, :amount, :category, :event_id ])
    end
end
