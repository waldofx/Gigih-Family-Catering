class Order < ApplicationRecord
    validates :customer_id, presence: true

    has_many :orderdetails
    has_many :menuitems, through: :orderdetails

    belongs_to :customer, optional: true
end
