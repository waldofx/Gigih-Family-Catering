class Customer < ApplicationRecord
    validates :name, presence: true
    validates :phone, presence: true
    validates :address, presence: true
    validates :email, presence: true, format: {
        with: /\A\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+\z/, message: "is not a valid email address"
    }
end
