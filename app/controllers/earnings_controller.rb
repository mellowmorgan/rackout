class EarningsController < ApplicationController
  before_action :set_earning, only: %i[ show edit update destroy ]

  # GET /earnings or /earnings.json
  def index
    @earnings = Earnings.where(event_id: params[:event_id])
  end

  # GET /earnings/1 or /earnings/1.json
  def show
  end

  # GET /earnings/new
  def new
    @earning = Earning.new
  end

  # GET /earnings/1/edit
  def edit
  end

  # POST /earnings or /earnings.json
  def create
    @earning = Earning.new(earning_params)

    respond_to do |format|
      if @earning.save
        format.html { redirect_to @earning, notice: "Earning was successfully created." }
        format.json { render :show, status: :created, location: @earning }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @earning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /earnings/1 or /earnings/1.json
  def update
    respond_to do |format|
      if @earning.update(earning_params)
        format.html { redirect_to @earning, notice: "Earning was successfully updated." }
        format.json { render :show, status: :ok, location: @earning }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @earning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earnings/1 or /earnings/1.json
  def destroy
    @earning.destroy!

    respond_to do |format|
      format.html { redirect_to earnings_path, status: :see_other, notice: "Earning was successfully destroyed." }
      format.json { head :no_content }
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
