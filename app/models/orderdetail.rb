class Orderdetail < ApplicationRecord
    before_save :set_item_price
    before_save :set_total


    validates :order_id, presence: true
    validates :menuitem_id, presence: true
    validates :quantity, presence: true

    belongs_to :menuitem
    belongs_to :order


    def item_price
        if persisted?
            self[:item_price]
        else
            menuitem.price
        end
    end

    def total
        item_price*quantity
    end

    private

    def set_item_price
        self[:item_price] = item_price 
    end

    def set_total
        self[:total] = total
    end
end
