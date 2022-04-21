class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]

  # GET /reports or /reports.json
  def index
    today = DateTime.current.to_date
    @reports = Order.joins(:customer).where("order_date = ?", today)
    # @reports = Order.joins("INNER JOIN menuitems ON menuitems.id = orderdetails.menuitem_id")
  end
  
end
