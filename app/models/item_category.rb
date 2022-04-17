class ItemCategory < ApplicationRecord
    validates :item_id, presence: true
    validates :category_id, presence: true

    belongs_to :menuitem, optional: true
    belongs_to :category, optional: true
end
