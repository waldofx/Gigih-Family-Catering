class ReportsController < ApplicationController
  # GET /reports or /reports.json
  def index
    today = DateTime.current.to_date
    @reports = Order.joins(:customer).where("order_date = ?", today)
  end
  
end
