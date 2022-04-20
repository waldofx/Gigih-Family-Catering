class Order < ApplicationRecord
    before_save :set_total

    validates :customer_id, presence: true

    has_many :orderdetails
    has_many :menuitems, through: :orderdetails

    belongs_to :customer, optional: true

    accepts_nested_attributes_for :orderdetails, allow_destroy:true

    def total
        self.orderdetails.map { |orderdetail| orderdetail.total }.sum
    end
    
    private

    def set_total
        self[:total] = total
    end
end
