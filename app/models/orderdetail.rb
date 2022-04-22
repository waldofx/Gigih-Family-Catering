class Orderdetail < ApplicationRecord
    before_save :set_price
    before_save :set_total
    after_save :order_total

    validates :order_id, presence: true
    validates :menuitem_id, presence: true
    validates :quantity, presence: true

    belongs_to :menuitem
    belongs_to :order


    def price
        if persisted?
            self[:price]
        elsif menuitem.nil?
            1.0
        else
            menuitem.price
        end
    end

    def total
        if price == 1.0
            1.0
        else
            price*quantity
        end
    end

    private

    def set_price
        self[:price] = price 
    end

    def set_total
        self[:total] = total
    end

    def order_total
        @order = Order.find(self[:order_id])
        @order.save
    end
end
