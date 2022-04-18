class Menuitem < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true, length: {
        maximum: 150,
        message: "must be less than 150 character"
    }
    validates :price, presence: true, numericality: {
        only_float: true,
        message: "must be numeric"
    }, comparison: {
        greater_than_or_equal_to: 0.01,
        message: "must be greater than or equal to 0.01"
    }

    def self.by_letter(letter)
        where("name LIKE ?", "#{letter}%").order(:name)
    end

    has_many :item_categories
    has_many :categories, through: :item_categories
end
