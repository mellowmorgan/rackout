class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]

  # GET /expenses/1 or /expenses/1.json
  def show
    @event = @expense.event
    @user = @event.user
  end

  # GET /expenses/new
  def new
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
    @event = @expense.event
    @user = @event.user
  end

  # POST /expenses or /expenses.json
  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @expense = @event.expenses.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to user_event_path(@user, @event), notice: "Expense was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    @event = @expense.event
    @user = @event.user
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to user_event_expense_path(@user, @event, @expense), notice: "Expense was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @event = @expense.event
    @user = @event.user
    @expense.destroy!

    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event), status: :see_other, notice: "Expense was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.expect(expense: [ :title, :description, :amount, :category, :event_id ])
    end
end
