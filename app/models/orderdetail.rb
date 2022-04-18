class Orderdetail < ApplicationRecord
    validates :order_id, presence: true
    validates :menuitem_id, presence: true
    validates :quantity, presence: true

    belongs_to :menuitem, optional: true
    belongs_to :order, optional: true
end
