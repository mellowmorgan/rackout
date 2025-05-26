class HomeController < ApplicationController
  def index
    if user_signed_in?
      @events = current_user.events.where(start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
    end

    render
  end
end