class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :dismiss_all

  def index
    if user_signed_in?
      @events = current_user.events.where(start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)

      @events_need_updating = current_user.events.needs_updating.to_json
    end

    render
  end 

  def dismiss_all
    @events = current_user.events.needs_updating
    result = @events.update_all(dismiss:true)
    respond_to do |format|
      if result > 0
        format.json { 
          render json: @events, status: :ok }
        format.html { 
        redirect_to root_path, notice: "Events successfully dismissed."}
      end
    end
  end
end