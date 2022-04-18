class Order < ApplicationRecord
    validates :customer_id, presence: true

    belongs_to :customer, optional: true
end
