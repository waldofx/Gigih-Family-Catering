json.extract! menuitem, :id, :name, :description, :price, :created_at, :updated_at
json.url menuitem_url(menuitem, format: :json)
