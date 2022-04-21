json.extract! report, :id, :customer_id, :total, :order_date, :status, :created_at, :updated_at
json.url report_url(report, format: :json)
