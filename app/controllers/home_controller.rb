class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :dismiss_all

  def index
    if user_signed_in?
      if params["start_date"]
        date = params["start_date"].to_date
      else
        date = Time.now
      end
      @events = current_user.events.where(start_time: date.beginning_of_month.beginning_of_week..date.end_of_month.end_of_week)

      @events_need_updating = current_user.events.needs_updating.to_json
 
    else
      redirect_to new_user_session_path
    end
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