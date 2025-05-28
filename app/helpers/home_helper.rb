module HomeHelper 
  def current_total_month
    start_month = Date.today.beginning_of_month.to_time
    end_month = (Date.today.end_of_month + 1.day).to_time - 1.second
    events_month = current_user.events.where(start_time:start_month..end_month)
    sum_earnings = events_month.sum{|event| event.earnings.sum(:amount)}

    #food deductions are subject to 50% vs 100% rate
    sum_expenses_food = events_month.sum{|event| event.expenses.where(category:"food").sum(:amount)}

    sum_expenses_other = events_month.sum{|event| event.expenses.where.not(category:"food").sum(:amount)}

    sum_earnings - (sum_expenses_food * 0.5) - sum_expenses_other
  end
end