json.extract! orderdetail, :id, :order_id, :menuitem_id, :quantity, :price, :created_at, :updated_at
json.url orderdetail_url(orderdetail, format: :json)
