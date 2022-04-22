class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :item_categories
    has_many :menuitems, through: :item_categories
end
